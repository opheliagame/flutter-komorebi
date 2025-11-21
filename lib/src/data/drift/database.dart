import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:flutter_komorebi/src/data/drift/domain/collection_media_table.dart';
import 'package:flutter_komorebi/src/data/drift/domain/collection_note_ref_table.dart';
import 'package:flutter_komorebi/src/data/drift/domain/collection_table.dart';
import 'package:flutter_komorebi/src/data/drift/domain/history_table.dart';
import 'package:flutter_komorebi/src/data/drift/domain/note_citation_table.dart';
import 'package:flutter_komorebi/src/data/drift/domain/note_table.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:path_provider/path_provider.dart';

part 'database.g.dart';

// MAIN DATABASE DEFINITION
@DriftDatabase(
  tables: [
    CollectionTable,
    NoteTable,
    CollectionNoteRefTable,
    CollectionMediaTable,
    NoteCitationTable,
    HistoryTable,
  ],
  views: [],
)
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

  // @override
  // MigrationStrategy get migration {
  //   return MigrationStrategy(
  //     onUpgrade: _schemaUpgrade,
  //     onCreate: (m) async {
  //       await m.createAll();
  //       await insertMeaningfulMockData();
  //     },
  //   );
  // }
}

// TODO(db): insert extension after a final initial release
// extension Migrations on GeneratedDatabase {
//   // Extracting the `stepByStep` call into a static field or method ensures that you're not
//   // accidentally referring to the current database schema (via a getter on the database class).
//   // This ensures that each step brings the database into the correct snapshot.
//   OnUpgrade get _schemaUpgrade => stepByStep(
//         from1To2: (m, schema) async {
//           await m.dropColumn(schema.collection, schema.collection.name.name);
//           await m.addColumn(schema.collection, schema.collection.name);
//           await m.dropColumn(schema.collection, schema.collection.description.name);
//           await m.addColumn(schema.collection, schema.collection.description);
//         },
//       );
// }

final appDatabaseProvider = Provider<AppDatabase>((ref) {
  final database = AppDatabase();
  return database;
});
