import 'dart:convert';

import 'package:drift/drift.dart';
import 'package:flutter_komorebi/src/data/drift/database.dart';
import 'package:uuid/uuid.dart';

/// Writes to [SyncEntityTable] and [SyncChangeLogTable] whenever a
/// sync-tracked row is created, updated or deleted, so the change can later
/// be shipped to peers. Must be called inside the same transaction as the
/// actual table write.
class SyncChangeTracker {
  SyncChangeTracker(this.database);

  final AppDatabase database;

  static const _uuid = Uuid();
  static const _deviceIdentityRowId = 0;
  String? _cachedDeviceId;

  /// Returns this device's persistent sync id, creating it on first use.
  Future<String> _deviceId() async {
    final cached = _cachedDeviceId;
    if (cached != null) return cached;

    final existing = await (database.select(database.deviceIdentityTable)
          ..where((t) => t.id.equals(_deviceIdentityRowId)))
        .getSingleOrNull();
    if (existing != null) {
      _cachedDeviceId = existing.deviceId;
      return existing.deviceId;
    }

    final deviceId = _uuid.v4();
    await database.into(database.deviceIdentityTable).insert(
          DeviceIdentityTableCompanion.insert(
            id: const Value(_deviceIdentityRowId),
            deviceId: deviceId,
            deviceName: 'Kiritori device',
          ),
        );
    _cachedDeviceId = deviceId;
    return deviceId;
  }

  /// Returns the uuid for [localId] of [entityType], creating the mapping
  /// (lazily backfilling) if it doesn't exist yet.
  Future<String> _ensureUuid(String entityType, int localId) async {
    final existing = await (database.select(database.syncEntityTable)
          ..where((t) => t.entityType.equals(entityType) & t.localId.equals(localId)))
        .getSingleOrNull();
    if (existing != null) return existing.uuid;

    final uuid = _uuid.v4();
    await database.into(database.syncEntityTable).insert(
          SyncEntityTableCompanion.insert(
            entityType: entityType,
            uuid: uuid,
            localId: localId,
            originDeviceId: await _deviceId(),
            updatedAt: DateTime.now(),
          ),
        );
    return uuid;
  }

  /// Records an insert or update of [localId]/[entityType] with the given
  /// [rowJson] snapshot.
  Future<void> recordUpsert({
    required String entityType,
    required int localId,
    required Map<String, dynamic> rowJson,
  }) async {
    final uuid = await _ensureUuid(entityType, localId);
    final now = DateTime.now();
    final deviceId = await _deviceId();

    await (database.update(database.syncEntityTable)
          ..where((t) => t.entityType.equals(entityType) & t.uuid.equals(uuid)))
        .write(SyncEntityTableCompanion(updatedAt: Value(now), isDeleted: const Value(false)));

    await database.into(database.syncChangeLogTable).insert(
          SyncChangeLogTableCompanion.insert(
            entityType: entityType,
            uuid: uuid,
            operation: 'upsert',
            payload: Value(jsonEncode(rowJson)),
            updatedAt: now,
            deviceId: deviceId,
          ),
        );
  }

  /// Records a delete of [localId]/[entityType] as a tombstone so peers can
  /// propagate the deletion.
  Future<void> recordDelete({required String entityType, required int localId}) async {
    final uuid = await _ensureUuid(entityType, localId);
    final now = DateTime.now();
    final deviceId = await _deviceId();

    await (database.update(database.syncEntityTable)
          ..where((t) => t.entityType.equals(entityType) & t.uuid.equals(uuid)))
        .write(SyncEntityTableCompanion(updatedAt: Value(now), isDeleted: const Value(true)));

    await database.into(database.syncChangeLogTable).insert(
          SyncChangeLogTableCompanion.insert(
            entityType: entityType,
            uuid: uuid,
            operation: 'delete',
            payload: const Value.absent(),
            updatedAt: now,
            deviceId: deviceId,
          ),
        );
  }
}
