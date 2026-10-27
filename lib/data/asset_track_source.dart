import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:spotube_demo/data/track_source.dart';
import 'package:spotube_demo/models/track.dart';

class AssetTrackSource implements TrackSource {
  @override
  Future<List<Track>> fetchTracks() async {
    await Future.delayed(const Duration(seconds: 2)); // 模拟 2s
    final raw = await rootBundle.loadString('assets/tracks.json');
    final list = jsonDecode(raw) as List;
    return list.map((e) => Track.fromJson(e as Map<String, dynamic>)).toList();
  }
}
