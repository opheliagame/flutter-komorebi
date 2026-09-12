import 'package:drift/drift.dart';

/// Tracks per-peer sync cursors so re-syncing only sends deltas, and which
/// peers are trusted (previously accepted) for silent future syncs.
class SyncPeerStateTable extends Table {
  @override
  String get tableName => 'sync_peer_state';

  TextColumn get peerDeviceId => text()();
  TextColumn get peerName => text()();
  // Highest sync_change_log.id (local to this device) already sent to this peer.
  IntColumn get lastSentChangeId => integer().withDefault(const Constant(0))();
  // Highest change id received from this peer that has been applied.
  IntColumn get lastReceivedChangeId => integer().withDefault(const Constant(0))();
  DateTimeColumn get lastSyncedAt => dateTime().nullable()();
  BoolColumn get isTrusted => boolean().withDefault(const Constant(false))();

  @override
  Set<Column<Object>> get primaryKey => {peerDeviceId};
}
