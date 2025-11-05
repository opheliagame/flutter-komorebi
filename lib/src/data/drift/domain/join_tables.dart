import 'package:drift/drift.dart';
import 'package:flutter_komorebi/src/data/drift/domain/collection.dart';
import 'package:flutter_komorebi/src/data/drift/domain/note.dart';

class CollectionNotes extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get noteId => integer().references(Notes, #id)();
  IntColumn get collectionId => integer().references(Collections, #id)();
}
