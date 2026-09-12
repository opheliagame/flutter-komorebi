import 'package:flutter_komorebi/src/features/device_sync/data/device_sync_providers.dart';
import 'package:flutter_komorebi/src/features/device_sync/data/sync_discovery_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DeviceSyncState {
  const DeviceSyncState({
    this.peers = const [],
    this.deviceName = '',
    this.isSyncing = false,
    this.lastSyncResult,
  });

  final List<DiscoveredPeer> peers;
  final String deviceName;
  final bool isSyncing;
  final String? lastSyncResult;

  DeviceSyncState copyWith({
    List<DiscoveredPeer>? peers,
    String? deviceName,
    bool? isSyncing,
    String? lastSyncResult,
  }) {
    return DeviceSyncState(
      peers: peers ?? this.peers,
      deviceName: deviceName ?? this.deviceName,
      isSyncing: isSyncing ?? this.isSyncing,
      lastSyncResult: lastSyncResult ?? this.lastSyncResult,
    );
  }
}

class DeviceSyncNotifier extends StateNotifier<DeviceSyncState> {
  DeviceSyncNotifier(this._ref) : super(const DeviceSyncState()) {
    _init();
  }

  final Ref _ref;

  Future<void> _init() async {
    final identity = await _ref.read(deviceIdentityServiceProvider).getOrCreateIdentity();
    state = state.copyWith(deviceName: identity.deviceName);

    final server = _ref.read(syncServerProvider);
    final port = await server.start();

    final discovery = _ref.read(syncDiscoveryServiceProvider);
    discovery.peers.listen((peers) => state = state.copyWith(peers: peers));
    await discovery.startAdvertising(deviceId: identity.deviceId, deviceName: identity.deviceName, port: port);
    await discovery.startDiscovery(selfDeviceId: identity.deviceId);
  }

  Future<void> syncWithPeer(DiscoveredPeer peer) async {
    state = state.copyWith(isSyncing: true, lastSyncResult: null);
    try {
      await _ref.read(syncClientProvider).syncWithPeer(host: peer.host, port: peer.port);
      state = state.copyWith(isSyncing: false, lastSyncResult: 'Synced with ${peer.deviceName}');
    } catch (e) {
      state = state.copyWith(isSyncing: false, lastSyncResult: 'Sync failed: $e');
    }
  }
}

final deviceSyncNotifierProvider = StateNotifierProvider.autoDispose<DeviceSyncNotifier, DeviceSyncState>((ref) {
  return DeviceSyncNotifier(ref);
});
