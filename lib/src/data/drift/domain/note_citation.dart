import 'package:drift/drift.dart';

class NoteCitations extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get title => text()();

  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get modifiedAt => dateTime()();
}
