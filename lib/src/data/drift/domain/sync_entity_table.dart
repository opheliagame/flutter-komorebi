import 'package:drift/drift.dart';

/// Maps a local autoincrement row id to a global uuid, per entity type,
/// so rows can be identified consistently across devices.
class SyncEntityTable extends Table {
  @override
  String get tableName => 'sync_entity';

  IntColumn get id => integer().autoIncrement()();
  TextColumn get entityType => text()();
  TextColumn get uuid => text()();
  IntColumn get localId => integer()();
  TextColumn get originDeviceId => text()();
  DateTimeColumn get updatedAt => dateTime()();
  BoolColumn get isDeleted => boolean().withDefault(const Constant(false))();

  @override
  List<Set<Column<Object>>> get uniqueKeys => [
        {entityType, uuid},
        {entityType, localId},
      ];
}
