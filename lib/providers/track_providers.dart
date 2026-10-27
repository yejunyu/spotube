import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:spotube_demo/data/memory_track_source.dart';
import 'package:spotube_demo/data/track_source.dart';
import 'package:spotube_demo/models/track.dart';

final trackSourceProvider = Provider<TrackSource>(
  (ref) => MemoryTrackSource(),
);

final trackListProvider = FutureProvider<List<Track>>((ref) async {
  return ref.watch(trackSourceProvider).fetchTracks();
});

class FavoritesNotifier extends Notifier<Set<String>> {
  @override
  Set<String> build() => <String>{};

  void toggle(String trackId) {
    state = state.contains(trackId)
        ? (Set<String>.from(state)..remove(trackId))
        : {...state, trackId};
  }
}

final favoritesProvider = NotifierProvider<FavoritesNotifier, Set<String>>(
  FavoritesNotifier.new,
);

class SearchTermNotifier extends Notifier<String> {
  @override
  String build() => '';

  void set(String term) => state = term;
}

final searchTermProvider = NotifierProvider<SearchTermNotifier, String>(
  SearchTermNotifier.new,
);
