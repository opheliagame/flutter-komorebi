import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_komorebi/src/features/device_sync/presentation/device_sync_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@RoutePage()
class DeviceSyncPage extends ConsumerWidget {
  const DeviceSyncPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(deviceSyncNotifierProvider);
    final notifier = ref.read(deviceSyncNotifierProvider.notifier);

    return Scaffold(
      appBar: AppBar(title: const Text('Sync devices')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text('This device: ${state.deviceName}'),
          ),
          if (state.lastSyncResult != null)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(state.lastSyncResult!),
            ),
          Expanded(
            child: state.peers.isEmpty
                ? const Center(child: Text('Looking for nearby devices on this Wi-Fi network...'))
                : ListView.builder(
                    itemCount: state.peers.length,
                    itemBuilder: (context, index) {
                      final peer = state.peers[index];
                      return ListTile(
                        title: Text(peer.deviceName),
                        subtitle: Text('${peer.host}:${peer.port}'),
                        trailing: state.isSyncing
                            ? const SizedBox(
                                width: 20,
                                height: 20,
                                child: CircularProgressIndicator(strokeWidth: 2),
                              )
                            : IconButton(
                                icon: const Icon(Icons.sync),
                                onPressed: () => notifier.syncWithPeer(peer),
                              ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
