import 'package:auto_route/auto_route.dart';
import 'package:flutter_komorebi/src/router/app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen|Page,Route')
class AppRouter extends RootStackRouter {
  @override
  RouteType get defaultRouteType => RouteType.material(); //.cupertino, .adaptive ..etc

  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          initial: true,
          path: '/',
          page: HomeRoute.page,
        ),
        AutoRoute(
          path: '/home',
          page: HomeListRoute.page,
        ),
        AutoRoute(
          path: '/create',
          page: CreateRoute.page,
        ),
        AutoRoute(
          path: '/search',
          page: SearchRoute.page,
        ),
        AutoRoute(
          path: '/roam',
          page: RoamRoute.page,
        )
      ];
}
