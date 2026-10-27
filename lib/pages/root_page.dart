import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../collections/routes.gr.dart';

@RoutePage()
class RootPage extends StatelessWidget {
  const RootPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter(
      routes: const [
        HomeRoute(),
        SearchRoute(),      // 下一步建
        FavoritesRoute(),   // 下一步建
      ],
      builder: (context, child) {
        final tabsRouter = AutoTabsRouter.of(context);
        return Scaffold(
          body: child,
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: tabsRouter.activeIndex,
            onTap: tabsRouter.setActiveIndex,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.library_music),
                label: '曲库',
              ),
              BottomNavigationBarItem(icon: Icon(Icons.search), label: '搜索'),
              BottomNavigationBarItem(icon: Icon(Icons.favorite), label: '收藏'),
            ],
          ),
        );
      },
    );
  }
}
