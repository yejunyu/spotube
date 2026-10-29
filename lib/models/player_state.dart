import 'package:spotube_demo/models/track.dart';

class TubePlayerState {
  final Track? currentTrack;
  final bool isPlaying;
  final Duration position;
  final Duration duration;

  TubePlayerState({
    this.currentTrack,
    this.isPlaying = false,
    this.position = Duration.zero,
    this.duration = Duration.zero,
  });

  TubePlayerState copyWith({
    Track? currentTrack,
    bool? isPlaying,
    Duration? position,
    Duration? duration,
  }) {
    return TubePlayerState(
      currentTrack: currentTrack ?? this.currentTrack,
      isPlaying: isPlaying ?? this.isPlaying,
      position: position ?? this.position,
      duration: duration ?? this.duration,
    );
  }
}
