import 'package:spotube_demo/data/track_source.dart';
import 'package:spotube_demo/models/track.dart';

class MemoryTrackSource implements TrackSource {
  @override
  Future<List<Track>> fetchTracks() async {
    await Future.delayed(const Duration(seconds: 2)); // 模拟 2s
    return [
      Track(id: '1', title: '翅膀', artist: '林俊杰', durationMs: 1000),
      Track(id: '4', title: '泡沫', artist: '邓紫棋', durationMs: 1000),
      Track(id: '5', title: '唯一', artist: '邓紫棋', durationMs: 1000),
    ];
  }
}
