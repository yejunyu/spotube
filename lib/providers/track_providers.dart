import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:spotube_demo/data/asset_track_source.dart';
import 'package:spotube_demo/data/database.dart';
import 'package:spotube_demo/data/track_source.dart';
import 'package:spotube_demo/models/track.dart';

final trackSourceProvider = Provider<TrackSource>((ref) => AssetTrackSource());

final trackListProvider = FutureProvider<List<Track>>((ref) async {
  return ref.watch(trackSourceProvider).fetchTracks();
});

// class FavoritesNotifier extends Notifier<Set<String>> {
//   @override
//   Set<String> build() => <String>{};
//
//   void toggle(String trackId) {
//     state = state.contains(trackId)
//         ? (Set<String>.from(state)..remove(trackId))
//         : {...state, trackId};
//   }
// }

// final favoritesProvider = NotifierProvider<FavoritesNotifier, Set<String>>(
//   FavoritesNotifier.new,
// );

final favoritesProvider = StreamProvider<Set<String>>((ref) {
  final db = ref.watch(databaseProvider);
  return db
      .select(db.favoriteTracks)
      .watch()
      .map((rows) => rows.map((r) => r.trackId).toSet());
});

class FavoritesController {
  final AppDatabase _db;

  FavoritesController(this._db);

  Future<void> add(String trackId) => _db
      .into(_db.favoriteTracks)
      .insert(FavoriteTracksCompanion.insert(trackId: trackId));

  Future<void> remove(String trackId) => (_db.delete(
    _db.favoriteTracks,
  )..where((t) => t.trackId.equals(trackId))).go();
}

final favoritesControllerProvider = Provider((ref) {
  return FavoritesController(ref.watch(databaseProvider));
});

class SearchTermNotifier extends Notifier<String> {
  @override
  String build() => '';

  void set(String term) => state = term;
}

final searchTermProvider = NotifierProvider<SearchTermNotifier, String>(
  SearchTermNotifier.new,
);

final databaseProvider = Provider<AppDatabase>((ref) {
  final db = AppDatabase();
  ref.onDispose(db.close);
  return db;
});
