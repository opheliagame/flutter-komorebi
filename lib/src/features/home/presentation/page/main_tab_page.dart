import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_komorebi/src/features/home/domain/entity_type.dart';
import 'package:flutter_komorebi/src/router/app_router.gr.dart';

@RoutePage()
class MainTabPage extends StatelessWidget {
  const MainTabPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter(
      routes: [
        HomeRoute(),
        SearchRoute(),
        RoamRoute(),
        CreateRoute(entityType: EntityType.note),
      ],
      transitionBuilder: (context, child, animation) => FadeTransition(
        opacity: animation,
        // the passed child is technically our animated selected-tab page
        child: child,
      ),
      builder: (context, child) {
        // obtain the scoped TabsRouter controller using context
        final tabsRouter = AutoTabsRouter.of(context);
        // Here we're building our Scaffold inside of AutoTabsRouter
        // to access the tabsRouter controller provided in this context
        //
        // alternatively, you could use a global key
        return Scaffold(
          body: child,
          bottomNavigationBar: tabsRouter.activeIndex == 2
              ? null
              : NavigationBar(
                  selectedIndex: tabsRouter.activeIndex,
                  destinations: const [
                    NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
                    NavigationDestination(icon: Icon(Icons.search), label: 'Search'),
                    NavigationDestination(icon: Icon(Icons.shuffle), label: 'Roam'),
                    NavigationDestination(icon: Icon(Icons.add), label: 'Create'),
                  ],
                  onDestinationSelected: (index) {
                    tabsRouter.setActiveIndex(index);
                  },
                ),
        );
      },
    );
  }
}
