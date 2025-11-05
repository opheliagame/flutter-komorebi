import 'package:drift/drift.dart';
import 'package:flutter_komorebi/src/data/drift/domain/collection_table.dart';
import 'package:flutter_komorebi/src/data/drift/domain/note_table.dart';

class CollectionNoteTable extends Table {
  @override
  String get tableName => 'collection_note';

  IntColumn get id => integer().autoIncrement()();
  IntColumn get noteId => integer().references(NoteTable, #id)();
  IntColumn get collectionId => integer().references(CollectionTable, #id)();
}
