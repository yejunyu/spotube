import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:spotube_demo/collections/routes.gr.dart';
import 'package:spotube_demo/components/fallbacks/empty_view.dart';
import 'package:spotube_demo/components/fallbacks/error_view.dart';
import 'package:spotube_demo/components/fallbacks/loading_view.dart';
import 'package:spotube_demo/providers/track_providers.dart';

@RoutePage()
class FavoritesPage extends ConsumerWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tracksAsync = ref.watch(trackListProvider);
    final favoritesAsync = ref.watch(favoritesProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('收藏')),
      body: tracksAsync.when(
        loading: () => const LoadingView(),
        error: (e, _) => ErrorView(
          error: e,
          onRetry: () => ref.invalidate(trackListProvider),
        ),
        data: (tracks) {
          // 收藏集合是数据库的流，第一帧还没吐值时先别渲染空态，
          // 否则会闪一下“还没有收藏的歌曲”。
          if (favoritesAsync.isLoading) {
            return const LoadingView();
          }

          final ids = favoritesAsync.value ?? const <String>{};
          final favorites = tracks.where((t) => ids.contains(t.id)).toList();

          if (favorites.isEmpty) {
            return const EmptyView(message: '还没有收藏的歌曲');
          }

          return ListView.builder(
            itemCount: favorites.length,
            itemBuilder: (context, i) {
              final t = favorites[i];
              return ListTile(
                title: Text(t.title),
                subtitle: Text(t.artist),
                trailing: IconButton(
                  tooltip: '取消收藏',
                  onPressed: () async {
                    await ref.read(favoritesControllerProvider).remove(t.id);
                  },
                  icon: const Icon(Icons.favorite),
                ),
                onTap: () =>
                    context.router.root.push(TrackDetailRoute(track: t)),
              );
            },
          );
        },
      ),
    );
  }
}
