import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:flutter_komorebi/src/data/drift/domain/collection_media_table.dart';
import 'package:flutter_komorebi/src/data/drift/domain/collection_table.dart';
import 'package:flutter_komorebi/src/data/drift/domain/history_table.dart';
import 'package:flutter_komorebi/src/data/drift/domain/join_tables.dart';
import 'package:flutter_komorebi/src/data/drift/domain/note_citation_table.dart';
import 'package:flutter_komorebi/src/data/drift/domain/note_table.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:path_provider/path_provider.dart';

part 'database.g.dart';

// MAIN DATABASE DEFINITION
@DriftDatabase(tables: [
  CollectionTable,
  NoteTable,
  CollectionNoteTable,
  CollectionMediaTable,
  NoteCitationTable,
  HistoryTable,
])
class AppDatabase extends _$AppDatabase {
  // After generating code, this class needs to define a `schemaVersion` getter
  // and a constructor telling drift where the database should be stored.
  // These are described in the getting started guide: https://drift.simonbinder.eu/setup/
  AppDatabase([QueryExecutor? executor]) : super(executor ?? _openConnection());

  @override
  int get schemaVersion => 1;

  static QueryExecutor _openConnection() {
    return driftDatabase(
      name: 'my_database',
      native: const DriftNativeOptions(
        // By default, `driftDatabase` from `package:drift_flutter` stores the
        // database files in `getApplicationDocumentsDirectory()`.
        databaseDirectory: getApplicationSupportDirectory,
      ),
      // If you need web support, see https://drift.simonbinder.eu/platforms/web/
    );
  }
}

final appDatabaseProvider = Provider<AppDatabase>((ref) {
  final database = AppDatabase();
  // database.insertMeaningfulMockData();
  return database;
});
