import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:spotube_demo/collections/routes.gr.dart';
import 'package:spotube_demo/components/fallbacks/empty_view.dart';
import 'package:spotube_demo/components/fallbacks/error_view.dart';
import 'package:spotube_demo/components/fallbacks/loading_view.dart';
import 'package:spotube_demo/providers/track_providers.dart';

@RoutePage()
class SearchPage extends ConsumerStatefulWidget {
  const SearchPage({super.key});

  @override
  ConsumerState<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends ConsumerState<SearchPage> {
  final _controller = TextEditingController();
  Timer? _debounce;

  @override
  void initState() {
    super.initState();
    _controller.addListener(_onTextChanged);
  }

  @override
  void dispose() {
    _debounce?.cancel();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final term = ref.watch(searchTermProvider);
    final asyncTracks = ref.watch(trackListProvider);

    print('provider 现在是: $term');

    // 这里 ref 直接在 state 里就能用！来自 ConsumerState
    return Scaffold(
      appBar: AppBar(title: const Text('搜索')),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: const InputDecoration(
                hintText: '搜索歌名或歌手名',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),
            Expanded(
              child: asyncTracks.when(
                data: (tracks) {
                  final filtered = term.isEmpty
                      ? tracks
                      : tracks.where((t) {
                          return t.title.toLowerCase().contains(
                                term.toLowerCase(),
                              ) ||
                              t.artist.toLowerCase().contains(
                                term.toLowerCase(),
                              );
                        }).toList();
                  if (filtered.isEmpty) {
                    return const EmptyView(message: '没有匹配的歌曲');
                  }
                  return ListView.builder(
                    itemCount: filtered.length,
                    itemBuilder: (context, i) {
                      final t = filtered[i];
                      final favIds =
                          ref.watch(favoritesProvider).value ?? <String>{};
                      final isFav = favIds.contains(t.id);
                      return ListTile(
                        title: Text(t.title),
                        subtitle: Text(t.artist),
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
                          icon: Icon(
                            isFav ? Icons.favorite : Icons.favorite_border,
                          ),
                        ),
                        onTap: () =>
                            context.router.root
                                .push(TrackDetailRoute(track: t)),
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
          ],
        ),
      ),
    );
  }

  void _onTextChanged() {
    if (_controller.value.composing != TextRange.empty) return;
    _debounce?.cancel();
    final keyword = _controller.text.trim();
    _debounce = Timer(const Duration(milliseconds: 300), () {
      ref.read(searchTermProvider.notifier).set(keyword);
    });
  }
}
