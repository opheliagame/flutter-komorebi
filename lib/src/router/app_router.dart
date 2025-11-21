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
          page: SampleRoute.page,
        ),
        AutoRoute(
          path: '/home',
          page: HomeRoute.page,
          children: [
            AutoRoute(
              path: 'home',
              page: HomeListRoute.page,
            ),
            AutoRoute(
              path: 'search',
              page: SearchRoute.page,
            ),
            AutoRoute(
              path: 'roam',
              page: RoamRoute.page,
            ),
          ],
        ),
        AutoRoute(
          path: '/collectionslist',
          page: CollectionsListRoute.page,
        ),
        AutoRoute(
          path: '/noteslist',
          page: NoteListRoute.page,
        ),
        AutoRoute(
          path: '/note-detail',
          page: NoteDetailRoute.page,
        ),
        AutoRoute(
          path: '/create',
          page: CreateRoute.page,
        ),
        AutoRoute(
          path: '/history-list',
          page: HistoryListRoute.page,
        ),
        AutoRoute(
          path: '/gridscaletest',
          page: GridScaleTestRoute.page,
        ),
        AutoRoute(
          path: '/image-copy-test',
          page: ImageClipboardSampleRoute.page,
        ),
        AutoRoute(
          path: '/diagram-1',
          page: ConnectionDiagramRoute.page,
        ),
        AutoRoute(
          path: '/recents-page',
          page: RecentsRoute.page,
        ),
      ];
}
