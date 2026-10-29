import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:spotube_demo/collections/routes.gr.dart';
import 'package:spotube_demo/components/fallbacks/error_view.dart';
import 'package:spotube_demo/components/fallbacks/loading_view.dart';
import 'package:spotube_demo/providers/track_providers.dart';

@RoutePage()
class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncTracks = ref.watch(trackListProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('我的曲库')),
      body: RefreshIndicator(
        onRefresh: () => ref.refresh(trackListProvider.future),
        child: asyncTracks.when(
          skipLoadingOnRefresh: true,
          data: (tracks) {
            if (tracks.isEmpty) {
              return const Center(child: Text('empty'));
            }
            return ListView.builder(
              itemCount: tracks.length,
              itemBuilder: (context, i) {
                final t = tracks[i];
                final favIds = ref.watch(favoritesProvider).value ?? <String>{};
                final isFav = favIds.contains(t.id);
                return ListTile(
                  title: Text(t.title),
                  subtitle: Text('${t.artist} - ${_fmt(t.durationMs)}'),
                  trailing: IconButton(
                    onPressed: () async {
                      final favIds =
                          ref.read(favoritesProvider).value ?? <String>{};
                      final ctrl = ref.read(favoritesControllerProvider);
                      if (favIds.contains(t.id)) {
                        await ctrl.remove(t.id);
                      } else {
                        await ctrl.add(t.id);
                      }
                    },
                    icon: Icon(isFav ? Icons.favorite : Icons.favorite_border),
                  ),
                  // onTap: () => Navigator.of(context).push(
                  //   MaterialPageRoute(
                  //     builder: (_) => TrackDetailPage(track: t),
                  //   ),
                  // ),
                  onTap: () =>
                      context.router.root.push(TrackDetailRoute(track: t)),
                );
              },
            );
          },
          error: (e, _) => ErrorView(
            error: e,
            onRetry: () => ref.invalidate(trackListProvider),
          ),
          loading: () => const LoadingView(),
        ),
      ),
    );
  }

  String _fmt(int durationMs) {
    final d = Duration(milliseconds: durationMs);
    return '${d.inMinutes}:${(d.inSeconds % 60).toString().padLeft(2, '0')}';
  }
}
