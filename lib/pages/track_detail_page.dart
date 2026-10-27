import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:spotube_demo/models/track.dart';

@RoutePage()
class TrackDetailPage extends StatelessWidget {
  final Track track;

  const TrackDetailPage({super.key, required this.track});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text(track.title)));
  }
}
