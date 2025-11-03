import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_komorebi/src/router/app_router.gr.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final currentNavigationBarIndexProvider = StateProvider<int>((ref) {
  return 0;
});

class AppBottomNavigationBar extends HookConsumerWidget {
  const AppBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedIndex = useState<int>(0);

    void onTap(int index) {
      selectedIndex.value = index;
      ref.read(currentNavigationBarIndexProvider.notifier).state = index;

      if (selectedIndex.value == 0) {
        context.pushRoute(HomeListRoute());
      } else if (selectedIndex.value == 1) {
        context.pushRoute(SearchRoute());
      } else if (selectedIndex.value == 2) {
        context.pushRoute(RoamRoute());
      }
    }

    return BottomNavigationBar(
      currentIndex: ref.watch(currentNavigationBarIndexProvider),
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
        BottomNavigationBarItem(icon: Icon(Icons.shuffle), label: 'Roam'),
      ],
      onTap: onTap,
    );
  }
}
