import 'package:flutter_komorebi/src/features/device_sync/data/sync_engine.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

/// Connects out to a peer's [SyncServer] to run a sync session.
class SyncClient {
  SyncClient(this.syncEngine);

  final SyncEngine syncEngine;

  Future<void> syncWithPeer({required String host, required int port}) async {
    final channel = WebSocketChannel.connect(Uri.parse('ws://$host:$port'));
    await channel.ready;
    await syncEngine.runSession(channel);
  }
}
