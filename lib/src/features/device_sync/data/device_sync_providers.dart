import 'package:flutter_komorebi/src/data/drift/database.dart';
import 'package:flutter_komorebi/src/features/device_sync/data/device_identity_service.dart';
import 'package:flutter_komorebi/src/features/device_sync/data/sync_client.dart';
import 'package:flutter_komorebi/src/features/device_sync/data/sync_discovery_service.dart';
import 'package:flutter_komorebi/src/features/device_sync/data/sync_engine.dart';
import 'package:flutter_komorebi/src/features/device_sync/data/sync_server.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final deviceIdentityServiceProvider = Provider<DeviceIdentityService>((ref) {
  return DeviceIdentityService(ref.read(appDatabaseProvider));
});

final syncDiscoveryServiceProvider = Provider<SyncDiscoveryService>((ref) {
  final service = SyncDiscoveryService();
  ref.onDispose(service.dispose);
  return service;
});

final syncEngineProvider = Provider<SyncEngine>((ref) {
  return SyncEngine(ref.read(appDatabaseProvider));
});

final syncServerProvider = Provider<SyncServer>((ref) {
  final server = SyncServer(ref.read(syncEngineProvider));
  ref.onDispose(server.stop);
  return server;
});

final syncClientProvider = Provider<SyncClient>((ref) {
  return SyncClient(ref.read(syncEngineProvider));
});
