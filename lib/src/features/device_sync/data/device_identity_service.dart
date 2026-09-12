import 'package:drift/drift.dart';
import 'package:flutter_komorebi/src/data/drift/database.dart';
import 'package:uuid/uuid.dart';

/// Generates and persists this device's identity (a stable uuid plus a
/// human-readable name) used to identify it to peers during P2P sync.
class DeviceIdentityService {
  DeviceIdentityService(this.database);

  final AppDatabase database;

  static const _uuid = Uuid();
  static const _rowId = 0;

  Future<DeviceIdentityTableData> getOrCreateIdentity() async {
    final existing = await (database.select(database.deviceIdentityTable)
          ..where((t) => t.id.equals(_rowId)))
        .getSingleOrNull();
    if (existing != null) return existing;

    final identity = DeviceIdentityTableCompanion.insert(
      id: const Value(_rowId),
      deviceId: _uuid.v4(),
      deviceName: 'Kiritori device',
    );
    await database.into(database.deviceIdentityTable).insert(identity);
    return (await (database.select(database.deviceIdentityTable)..where((t) => t.id.equals(_rowId)))
        .getSingle());
  }

  Future<void> setDeviceName(String name) async {
    await (database.update(database.deviceIdentityTable)..where((t) => t.id.equals(_rowId)))
        .write(DeviceIdentityTableCompanion(deviceName: Value(name)));
  }
}
