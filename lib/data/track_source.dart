import 'package:spotube_demo/models/track.dart';

abstract class TrackSource {
  Future<List<Track>> fetchTracks();
}
