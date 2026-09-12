import 'dart:async';
import 'dart:convert';

import 'package:drift/drift.dart';
import 'package:flutter_komorebi/src/data/drift/database.dart';
import 'package:flutter_komorebi/src/data/drift/sync/sync_entity_adapters.dart';
import 'package:flutter_komorebi/src/features/device_sync/data/device_identity_service.dart';
import 'package:flutter_komorebi/src/features/device_sync/data/sync_protocol.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

/// Drives one sync session over an already-open [WebSocketChannel]: hello
/// handshake, bidirectional changes exchange, and applying incoming changes
/// with last-write-wins conflict resolution.
class SyncEngine {
  SyncEngine(this.database) : _deviceIdentity = DeviceIdentityService(database);

  final AppDatabase database;
  final DeviceIdentityService _deviceIdentity;

  Future<void> runSession(WebSocketChannel channel) async {
    final incoming = StreamIterator(channel.stream);
    final self = await _deviceIdentity.getOrCreateIdentity();

    channel.sink.add(jsonEncode(HelloMessage(deviceId: self.deviceId, deviceName: self.deviceName).toJson()));
    await incoming.moveNext();
    final helloJson = jsonDecode(incoming.current as String) as Map<String, dynamic>;
    final peerHello = HelloMessage.fromJson(helloJson);

    final peerState = await _getOrCreatePeerState(peerHello.deviceId, peerHello.deviceName);

    // Ask the peer for everything we haven't received from them yet.
    channel.sink.add(jsonEncode(ChangesRequestMessage(sinceId: peerState.lastReceivedChangeId).toJson()));

    await incoming.moveNext();
    final requestJson = jsonDecode(incoming.current as String) as Map<String, dynamic>;
    final theirRequest = ChangesRequestMessage.fromJson(requestJson);

    final outgoing = await _changesSince(theirRequest.sinceId);
    channel.sink.add(jsonEncode(ChangesBatchMessage(entries: outgoing).toJson()));

    await incoming.moveNext();
    final batchJson = jsonDecode(incoming.current as String) as Map<String, dynamic>;
    final theirBatch = ChangesBatchMessage.fromJson(batchJson);

    var highestApplied = peerState.lastReceivedChangeId;
    for (final entry in theirBatch.entries) {
      await _applyIncoming(entry);
      if (entry.id > highestApplied) highestApplied = entry.id;
    }

    channel.sink.add(jsonEncode(AckMessage(receivedUpTo: highestApplied).toJson()));

    await (database.update(database.syncPeerStateTable)..where((t) => t.peerDeviceId.equals(peerHello.deviceId)))
        .write(
      SyncPeerStateTableCompanion(
        lastSentChangeId: Value(outgoing.isEmpty ? peerState.lastSentChangeId : outgoing.last.id),
        lastReceivedChangeId: Value(highestApplied),
        lastSyncedAt: Value(DateTime.now()),
        isTrusted: const Value(true),
      ),
    );

    await channel.sink.close();
  }

  Future<SyncPeerStateTableData> _getOrCreatePeerState(String peerDeviceId, String peerName) async {
    final existing = await (database.select(database.syncPeerStateTable)
          ..where((t) => t.peerDeviceId.equals(peerDeviceId)))
        .getSingleOrNull();
    if (existing != null) return existing;

    await database.into(database.syncPeerStateTable).insert(
          SyncPeerStateTableCompanion.insert(peerDeviceId: peerDeviceId, peerName: peerName),
        );
    return (await (database.select(database.syncPeerStateTable)
          ..where((t) => t.peerDeviceId.equals(peerDeviceId)))
        .getSingle());
  }

  Future<List<ChangeEntry>> _changesSince(int sinceId) async {
    final rows = await (database.select(database.syncChangeLogTable)
          ..where((t) => t.id.isBiggerThanValue(sinceId))
          ..orderBy([(t) => OrderingTerm.asc(t.id)]))
        .get();

    return rows
        .map((r) => ChangeEntry(
              id: r.id,
              entityType: r.entityType,
              uuid: r.uuid,
              operation: r.operation,
              payload: r.payload == null ? null : jsonDecode(r.payload!) as Map<String, dynamic>,
              updatedAt: r.updatedAt,
              deviceId: r.deviceId,
            ))
        .toList();
  }

  Future<void> _applyIncoming(ChangeEntry entry) async {
    await database.transaction(() async {
      final existing = await (database.select(database.syncEntityTable)
            ..where((t) => t.entityType.equals(entry.entityType) & t.uuid.equals(entry.uuid)))
          .getSingleOrNull();

      // Last-write-wins: ignore incoming changes older than what we already have.
      if (existing != null && !entry.updatedAt.isAfter(existing.updatedAt)) return;

      int localId;
      if (entry.operation == 'delete') {
        if (existing == null) return;
        localId = existing.localId;
        await _deleteLocalRow(entry.entityType, localId);
      } else {
        localId = await _upsertLocalRow(entry.entityType, existing?.localId, entry.payload!);
      }

      final mapping = SyncEntityTableCompanion.insert(
        entityType: entry.entityType,
        uuid: entry.uuid,
        localId: localId,
        originDeviceId: entry.deviceId,
        updatedAt: entry.updatedAt,
        isDeleted: Value(entry.operation == 'delete'),
      );
      if (existing == null) {
        await database.into(database.syncEntityTable).insert(mapping);
      } else {
        await (database.update(database.syncEntityTable)..where((t) => t.id.equals(existing.id))).write(mapping);
      }
    });
  }

  Future<int> _upsertLocalRow(String entityType, int? localId, Map<String, dynamic> json) {
    switch (entityType) {
      case collectionEntityType:
        return applyCollectionJson(database, localId, json);
      case noteEntityType:
        return applyNoteJson(database, localId, json);
      default:
        throw UnsupportedError('Unknown sync entity type: $entityType');
    }
  }

  Future<void> _deleteLocalRow(String entityType, int localId) async {
    switch (entityType) {
      case collectionEntityType:
        await (database.delete(database.collectionTable)..where((t) => t.id.equals(localId))).go();
      case noteEntityType:
        await (database.delete(database.noteTable)..where((t) => t.id.equals(localId))).go();
      default:
        throw UnsupportedError('Unknown sync entity type: $entityType');
    }
  }
}
