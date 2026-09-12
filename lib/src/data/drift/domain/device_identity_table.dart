import 'package:drift/drift.dart';

/// Single-row table holding this device's persistent identity for P2P sync.
class DeviceIdentityTable extends Table {
  @override
  String get tableName => 'device_identity';

  IntColumn get id => integer().withDefault(const Constant(0))();
  TextColumn get deviceId => text()();
  TextColumn get deviceName => text()();

  @override
  Set<Column<Object>> get primaryKey => {id};
}
