import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:spotube_demo/models/player_state.dart';
import 'package:spotube_demo/models/track.dart';

class PlayerNotifier extends Notifier<TubePlayerState> {
  final AudioPlayer _player = AudioPlayer();
  StreamSubscription<Duration>? _posSub;

  @override
  TubePlayerState build() {
    ref.onDispose(() async {
      await _posSub?.cancel();
      await _player.dispose();
    });
    return TubePlayerState();
  }

  Future<void> select(Track track) async {
    await _posSub?.cancel();
    await _player.play(AssetSource(track.audio.replaceFirst('assets/', '')));
    _posSub = _player.onPositionChanged.listen((d) {
      state = state.copyWith(position: d);
    });
    state = TubePlayerState(
      currentTrack: track,
      isPlaying: true,
      duration: Duration(milliseconds: track.durationMs),
    );
  }

  Future<void> stop() async {
    await _posSub?.cancel();
    await _player.stop();
    state = TubePlayerState();
  }
}

final playerProvider = NotifierProvider<PlayerNotifier, TubePlayerState>(
  PlayerNotifier.new,
);
