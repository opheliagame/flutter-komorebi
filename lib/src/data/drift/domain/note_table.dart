import 'package:drift/drift.dart';
import 'package:flutter_komorebi/src/core/domain/note_entity.dart';
import 'package:flutter_komorebi/src/data/drift/database.dart';
import 'package:flutter_komorebi/src/data/drift/domain/note_citation_table.dart';

class NoteTable extends Table {
  @override
  String get tableName => 'note';

  IntColumn get id => integer().autoIncrement()();
  // TODO(domain): make content note and media note so that only one of them is nullable at a time
  TextColumn get content => text().nullable()();
  BlobColumn get media => blob().nullable()();

  // citations are nullable because some notes are just thoughts
  IntColumn get citationId => integer().nullable().references(NoteCitationTable, #id)();

  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get modifiedAt => dateTime()();
}

// class TextNote extends NoteTable {
//   TextColumn get content => text().nullable()();
// }

// class MediaNote extends NoteTable {
//   BlobColumn get media => blob().nullable()();
// }

extension NoteMapper on NoteTableData {
  NoteEntity toDomain() {
    return NoteEntity(
      id: id,
      content: content,
      media: media,
      citationId: citationId,
      createdAt: createdAt,
      modifiedAt: modifiedAt,
    );
  }
}
