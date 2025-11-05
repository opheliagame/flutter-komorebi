import 'package:drift/drift.dart';
import 'package:flutter_komorebi/src/data/drift/database.dart';

class NoteCitationTable extends Table {
  @override
  String get tableName => 'note_citation';

  IntColumn get id => integer().autoIncrement()();
  TextColumn get title => text()();

  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get modifiedAt => dateTime()();
}

extension NoteCitationMapper on NoteCitationTableData {}
