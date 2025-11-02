import 'package:flutter/material.dart';
import 'package:flutter_komorebi/src/features/collections/presentation/collections_grid.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CollectionsListPage extends ConsumerWidget {
  const CollectionsListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SafeArea(
        child: CollectionsGrid(),
      ),
    );
  }
}
