import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_komorebi/src/data/drift/database.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

class DatabaseBackupService {
  DatabaseBackupService(this.db);

  final AppDatabase db;

  // Must match the `name` passed to driftDatabase() in database.dart.
  static const _dbFileName = 'komorebi_personal_archive.sqlite';
  // Friendly name used when exporting.
  static const _exportFileName = 'komorebi_personal_archive.bkp.sqlite';

  Future<File> _dbFile() async {
    final dir = await getApplicationSupportDirectory();
    return File(p.join(dir.path, _dbFileName));
  }

  /// Copies the live database file to a temp location and shares it.
  Future<void> exportDatabase(BuildContext context) async {
    try {
      final src = await _dbFile();
      if (!await src.exists()) {
        if (context.mounted) {
          _showSnack(context, 'Database file not found at ${src.path}');
        }
        return;
      }

      // Checkpoint WAL so the exported file is fully self-contained.
      await db.customStatement('PRAGMA wal_checkpoint(TRUNCATE)');

      // Copy to a temp file with the friendly export name.
      final tmp = Directory.systemTemp;
      final dest = File(p.join(tmp.path, _exportFileName));
      await src.copy(dest.path);

      if (Platform.isAndroid) {
        // On Android use the SAF "save document" picker — shows Downloads,
        // Drive, and any registered file handler as save destinations.
        final savedPath = await FilePicker.saveFile(
          fileName: _exportFileName,
          bytes: await dest.readAsBytes(),
        );
        if (context.mounted) {
          _showSnack(context, savedPath != null ? 'Saved to $savedPath' : 'Export cancelled');
        }
      } else {
        // On iOS/macOS the share sheet includes "Save to Files".
        await SharePlus.instance.share(
          ShareParams(
            files: [XFile(dest.path, mimeType: 'application/octet-stream')],
            subject: 'komorebi database export',
          ),
        );
      }
    } catch (e) {
      if (context.mounted) _showSnack(context, 'Export failed: $e');
    }
  }

  /// Lets the user pick a .sqlite file, closes the connection, replaces the
  /// database file, then re-opens it. The caller should hot-restart or
  /// invalidate providers after this returns true.
  Future<bool> importDatabase(BuildContext context) async {
    try {
      final result = await FilePicker.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['sqlite', 'db', 'sqlite3'],
        withData: false,
        withReadStream: false,
      );

      if (result == null || result.files.single.path == null) return false;

      final srcPath = result.files.single.path!;
      final dest = await _dbFile();

      if (!context.mounted) {
        return false;
      }
      final confirmed = await showDialog<bool>(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text('replace database?'),
          content: const Text(
            'This will overwrite all current data with the selected file. '
            'The app will restart after import.',
          ),
          actions: [
            TextButton(onPressed: () => Navigator.pop(ctx, false), child: const Text('cancel')),
            TextButton(onPressed: () => Navigator.pop(ctx, true), child: const Text('replace')),
          ],
        ),
      );

      if (confirmed != true) return false;

      // Close drift connection before touching the file.
      await db.close();

      await File(srcPath).copy(dest.path);

      if (context.mounted) {
        _showSnack(context, 'Import successful — please restart the app');
      }
      return true;
    } catch (e) {
      if (context.mounted) _showSnack(context, 'Import failed: $e');
      return false;
    }
  }

  void _showSnack(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
  }
}

final databaseBackupServiceProvider = Provider<DatabaseBackupService>((ref) {
  return DatabaseBackupService(ref.read(appDatabaseProvider));
});
