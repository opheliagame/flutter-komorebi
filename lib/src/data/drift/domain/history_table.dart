import 'package:drift/drift.dart';
import 'package:flutter_komorebi/src/core/domain/history_entity.dart';
import 'package:flutter_komorebi/src/data/drift/database.dart';
import 'package:flutter_komorebi/src/data/drift/domain/collection_table.dart';
import 'package:flutter_komorebi/src/data/drift/domain/note_table.dart';

class HistoryTable extends Table {
  @override
  String? get tableName => 'history';

  IntColumn get id => integer().autoIncrement()();
  IntColumn get noteId => integer().nullable().references(NoteTable, #id)();
  IntColumn get collectionId => integer().nullable().references(CollectionTable, #id)();
  IntColumn get historyType => integer()();
  TextColumn get content => text().nullable()();

  DateTimeColumn get createdAt => dateTime()();
}

extension HistoryMapper on HistoryTableData {
  HistoryEntity toDomain() {
    return HistoryEntity(
      id: id,
      noteId: noteId,
      collectionId: collectionId,
      historyType: HistoryType.toEnum(historyType),
      content: content,
      createdAt: createdAt,
    );
  }
}
