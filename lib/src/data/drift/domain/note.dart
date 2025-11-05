import 'package:drift/drift.dart';
import 'package:flutter_komorebi/src/data/drift/domain/note_citation.dart';

class Notes extends Table {
  IntColumn get id => integer().autoIncrement()();
  // TODO make content note and media note so that only one of them is nullable at a time
  TextColumn get content => text().nullable()();
  BlobColumn get media => blob().nullable()();

  // citations are nullable because some notes are just thoughts
  IntColumn get citationId => integer().nullable().references(NoteCitations, #id)();

  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get modifiedAt => dateTime()();
}

class TextNote extends Notes {
  TextColumn get content => text().nullable()();
}

class MediaNote extends Notes {
  BlobColumn get media => blob().nullable()();
}
