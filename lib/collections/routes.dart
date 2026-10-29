import 'package:auto_route/auto_route.dart';

import 'routes.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(
      page: RootRoute.page,
      path: '/',
      initial: true,
      children: [
        AutoRoute(page: HomeRoute.page, path: ''),
        AutoRoute(page: SearchRoute.page, path: 'search'),
        AutoRoute(page: FavoritesRoute.page, path: 'favorites'),
      ],
    ),
    // 详情页放在「根层级」：它会盖在 Tab 壳之上（全屏），
    // 而不是成为第 4 个 Tab。
    AutoRoute(page: TrackDetailRoute.page, path: '/track/:id'),
  ];
}
