import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_komorebi/src/data/drift/database.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

class DatabaseBackupService {
  DatabaseBackupService(this.db);

  final AppDatabase db;

  // Must match the `name` passed to driftDatabase() in database.dart.
  static const _dbFileName = 'my_database.sqlite';
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

      // Write picked file to a temp path so we can ATTACH it.
      final bytes = await File(srcPath).readAsBytes();
      final tmp = await getTemporaryDirectory();
      final tmpFile = File(p.join(tmp.path, 'import_src.sqlite'));
      await tmpFile.writeAsBytes(bytes, flush: true);

      // Use ATTACH to copy data in-place — no connection close needed.
      await _copyFromAttached(tmpFile.path);
      await tmpFile.delete();

      if (context.mounted) {
        _showSnack(context, 'Import successful');
      }
      return true;
    } catch (e) {
      if (context.mounted) _showSnack(context, 'Import failed: $e');
      return false;
    }
  }

  /// Loads the bundled sample database from assets and replaces the live DB.
  static const _sampleAssetPath = 'assets/komorebi_personal_archive.bkp.sqlite';

  Future<bool> loadSampleDatabase(BuildContext context) async {
    try {
      if (!context.mounted) return false;
      final confirmed = await showDialog<bool>(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text('load sample database?'),
          content: const Text(
            'This will overwrite all current data with the bundled sample file.',
          ),
          actions: [
            TextButton(onPressed: () => Navigator.pop(ctx, false), child: const Text('cancel')),
            TextButton(onPressed: () => Navigator.pop(ctx, true), child: const Text('load')),
          ],
        ),
      );

      if (confirmed != true) return false;

      final byteData = await rootBundle.load(_sampleAssetPath);
      final bytes = byteData.buffer.asUint8List();

      // Write asset bytes to a temp file so SQLite can ATTACH it.
      final tmp = await getTemporaryDirectory();
      final tmpFile = File(p.join(tmp.path, 'sample_src.sqlite'));
      await tmpFile.writeAsBytes(bytes, flush: true);

      // Use ATTACH to copy data in-place — no connection close needed.
      await _copyFromAttached(tmpFile.path);
      await tmpFile.delete();

      if (context.mounted) {
        _showSnack(context, 'Sample database loaded');
      }
      return true;
    } catch (e) {
      if (context.mounted) _showSnack(context, 'Load sample failed: $e');
      return false;
    }
  }

  /// Replaces all data in the live database by ATTACHing [srcPath] and copying
  /// each table row-by-row. The connection is never closed.
  Future<void> _copyFromAttached(String srcPath) async {
    // ATTACH and DETACH must be outside any transaction in SQLite.
    await db.customStatement('ATTACH DATABASE ? AS src', [srcPath]);
    try {
      // Query which tables actually exist in the source file.
      final srcTablesResult = await db
          .customSelect(
            "SELECT name FROM src.sqlite_master WHERE type='table'",
          )
          .get();
      final srcTables = srcTablesResult.map((r) => r.read<String>('name')).toSet();
      debugPrint('📦 src tables: $srcTables');

      await db.transaction(() async {
        // Disable FK checks so we can repopulate in any order.
        await db.customStatement('PRAGMA foreign_keys = OFF');

        // Delete in reverse-dependency order.
        const deleteOrder = [
          'history',
          'collection_note_ref',
          'note',
          'collection',
          'note_citation',
          'collection_media',
        ];
        // Insert in forward-dependency order (parents before children).
        const insertOrder = [
          'collection_media',
          'note_citation',
          'collection',
          'note',
          'collection_note_ref',
          'history',
        ];

        for (final table in deleteOrder) {
          if (!srcTables.contains(table)) {
            debugPrint('⏭️ skip delete "$table": not in source');
            continue;
          }
          try {
            await db.customStatement('DELETE FROM "$table"');
          } catch (e) {
            debugPrint('⚠️ skip delete "$table": $e');
          }
        }
        for (final table in insertOrder) {
          if (!srcTables.contains(table)) {
            debugPrint('⏭️ skip insert "$table": not in source');
            continue;
          }
          try {
            await db.customStatement('INSERT INTO "$table" SELECT * FROM src."$table"');
          } catch (e) {
            debugPrint('⚠️ skip insert "$table": $e');
          }
        }

        await db.customStatement('PRAGMA foreign_keys = ON');
      });
    } finally {
      await db.customStatement('DETACH DATABASE src');
    }
  }

  void _showSnack(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
  }
}

final databaseBackupServiceProvider = Provider<DatabaseBackupService>((ref) {
  return DatabaseBackupService(ref.read(appDatabaseProvider));
});
