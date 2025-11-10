// dart format width=80
// ignore_for_file: unused_local_variable, unused_import
import 'package:drift/drift.dart';
import 'package:drift_dev/api/migrations_native.dart';
import 'package:flutter_komorebi/src/data/drift/database.dart';
import 'package:flutter_test/flutter_test.dart';
import 'generated/schema.dart';

import 'generated/schema_v1.dart' as v1;
import 'generated/schema_v2.dart' as v2;

void main() {
  driftRuntimeOptions.dontWarnAboutMultipleDatabases = true;
  late SchemaVerifier verifier;

  setUpAll(() {
    verifier = SchemaVerifier(GeneratedHelper());
  });

  group('simple database migrations', () {
    // These simple tests verify all possible schema updates with a simple (no
    // data) migration. This is a quick way to ensure that written database
    // migrations properly alter the schema.
    const versions = GeneratedHelper.versions;
    for (final (i, fromVersion) in versions.indexed) {
      group('from $fromVersion', () {
        for (final toVersion in versions.skip(i + 1)) {
          test('to $toVersion', () async {
            final schema = await verifier.schemaAt(fromVersion);
            final db = AppDatabase(schema.newConnection());
            await verifier.migrateAndValidate(db, toVersion);
            await db.close();
          });
        }
      });
    }
  });

  // The following template shows how to write tests ensuring your migrations
  // preserve existing data.
  // Testing this can be useful for migrations that change existing columns
  // (e.g. by alterating their type or constraints). Migrations that only add
  // tables or columns typically don't need these advanced tests. For more
  // information, see https://drift.simonbinder.eu/migrations/tests/#verifying-data-integrity
  // TODO: This generated template shows how these tests could be written. Adopt
  // it to your own needs when testing migrations with data integrity.
  test('migration from v1 to v2 does not corrupt data', () async {
    // Add data to insert into the old database, and the expected rows after the
    // migration.
    // TODO: Fill these lists
    final oldCollectionMediaData = <v1.CollectionMediaData>[];
    final expectedNewCollectionMediaData = <v2.CollectionMediaData>[];

    final oldCollectionData = <v1.CollectionData>[];
    final expectedNewCollectionData = <v2.CollectionData>[];

    final oldNoteCitationData = <v1.NoteCitationData>[];
    final expectedNewNoteCitationData = <v2.NoteCitationData>[];

    final oldNoteData = <v1.NoteData>[];
    final expectedNewNoteData = <v2.NoteData>[];

    final oldCollectionNoteData = <v1.CollectionNoteData>[];
    final expectedNewCollectionNoteData = <v2.CollectionNoteData>[];

    final oldHistoryData = <v1.HistoryData>[];
    final expectedNewHistoryData = <v2.HistoryData>[];

    await verifier.testWithDataIntegrity(
      oldVersion: 1,
      newVersion: 2,
      createOld: v1.DatabaseAtV1.new,
      createNew: v2.DatabaseAtV2.new,
      openTestedDatabase: AppDatabase.new,
      createItems: (batch, oldDb) {
        batch.insertAll(oldDb.collectionMedia, oldCollectionMediaData);
        batch.insertAll(oldDb.collection, oldCollectionData);
        batch.insertAll(oldDb.noteCitation, oldNoteCitationData);
        batch.insertAll(oldDb.note, oldNoteData);
        batch.insertAll(oldDb.collectionNote, oldCollectionNoteData);
        batch.insertAll(oldDb.history, oldHistoryData);
      },
      validateItems: (newDb) async {
        expect(expectedNewCollectionMediaData,
            await newDb.select(newDb.collectionMedia).get());
        expect(expectedNewCollectionData,
            await newDb.select(newDb.collection).get());
        expect(expectedNewNoteCitationData,
            await newDb.select(newDb.noteCitation).get());
        expect(expectedNewNoteData, await newDb.select(newDb.note).get());
        expect(expectedNewCollectionNoteData,
            await newDb.select(newDb.collectionNote).get());
        expect(expectedNewHistoryData, await newDb.select(newDb.history).get());
      },
    );
  });
}
