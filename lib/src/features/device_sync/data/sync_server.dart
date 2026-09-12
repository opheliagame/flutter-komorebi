import 'dart:io';

import 'package:flutter_komorebi/src/features/device_sync/data/sync_engine.dart';
import 'package:shelf/shelf_io.dart' as shelf_io;
import 'package:shelf_web_socket/shelf_web_socket.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

/// Listens for incoming sync connections from peers on the local network.
class SyncServer {
  SyncServer(this.syncEngine);

  final SyncEngine syncEngine;

  HttpServer? _server;

  int? get port => _server?.port;

  Future<int> start() async {
    final handler = webSocketHandler((WebSocketChannel channel, String? protocol) {
      syncEngine.runSession(channel);
    });
    _server = await shelf_io.serve(handler, InternetAddress.anyIPv4, 0);
    return _server!.port;
  }

  Future<void> stop() async {
    await _server?.close(force: true);
    _server = null;
  }
}
