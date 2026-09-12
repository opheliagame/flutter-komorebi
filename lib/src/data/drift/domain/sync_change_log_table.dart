import 'package:drift/drift.dart';

/// Append-only log of local writes, used as the outbox for P2P sync.
class SyncChangeLogTable extends Table {
  @override
  String get tableName => 'sync_change_log';

  IntColumn get id => integer().autoIncrement()();
  TextColumn get entityType => text()();
  TextColumn get uuid => text()();
  // 'insert', 'update' or 'delete'.
  TextColumn get operation => text()();
  // JSON snapshot of the row; null for deletes.
  TextColumn get payload => text().nullable()();
  DateTimeColumn get updatedAt => dateTime()();
  TextColumn get deviceId => text()();
}
