import 'dart:async';
import 'dart:typed_data';

import 'package:nsd/nsd.dart' as nsd;

const syncServiceType = '_komorebi-sync._tcp';

class DiscoveredPeer {
  DiscoveredPeer({required this.deviceId, required this.deviceName, required this.host, required this.port});

  final String deviceId;
  final String deviceName;
  final String host;
  final int port;
}

/// Advertises this device's sync service on the local network (mDNS/Bonjour)
/// and discovers other Kiritori devices doing the same.
class SyncDiscoveryService {
  nsd.Registration? _registration;
  nsd.Discovery? _discovery;

  final _peersController = StreamController<List<DiscoveredPeer>>.broadcast();
  final Map<String, DiscoveredPeer> _peers = {};

  Stream<List<DiscoveredPeer>> get peers => _peersController.stream;

  Future<void> startAdvertising({
    required String deviceId,
    required String deviceName,
    required int port,
  }) async {
    _registration = await nsd.register(
      nsd.Service(
        name: 'kiritori-$deviceId',
        type: syncServiceType,
        port: port,
        txt: {
          'deviceId': Uint8List.fromList(deviceId.codeUnits),
          'deviceName': Uint8List.fromList(deviceName.codeUnits),
        },
      ),
    );
  }

  Future<void> stopAdvertising() async {
    final registration = _registration;
    if (registration != null) {
      await nsd.unregister(registration);
      _registration = null;
    }
  }

  Future<void> startDiscovery({required String selfDeviceId}) async {
    final discovery = await nsd.startDiscovery(syncServiceType, ipLookupType: nsd.IpLookupType.any);
    discovery.addServiceListener((service, status) {
      final txt = service.txt;
      final host = service.addresses?.firstOrNull?.address;
      final port = service.port;
      if (txt == null || host == null || port == null) return;

      final deviceId = _decodeTxt(txt['deviceId']);
      final deviceName = _decodeTxt(txt['deviceName']);
      if (deviceId == null || deviceName == null || deviceId == selfDeviceId) return;

      if (status == nsd.ServiceStatus.found) {
        _peers[deviceId] = DiscoveredPeer(deviceId: deviceId, deviceName: deviceName, host: host, port: port);
      } else {
        _peers.remove(deviceId);
      }
      _peersController.add(_peers.values.toList());
    });
    _discovery = discovery;
  }

  String? _decodeTxt(List<int>? bytes) => bytes == null ? null : String.fromCharCodes(bytes);

  Future<void> stopDiscovery() async {
    final discovery = _discovery;
    if (discovery != null) {
      await nsd.stopDiscovery(discovery);
      _discovery = null;
    }
  }

  Future<void> dispose() async {
    await stopAdvertising();
    await stopDiscovery();
    await _peersController.close();
  }
}
