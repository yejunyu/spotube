import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:spotube_demo/models/track.dart';
import 'package:spotube_demo/providers/player_providers.dart';

@RoutePage()
class TrackDetailPage extends ConsumerWidget {
  final Track track;

  const TrackDetailPage({super.key, required this.track});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ps = ref.watch(playerProvider);
    final isCurrent = ps.currentTrack?.id == track.id;
    final playing = isCurrent && ps.isPlaying;
    return Scaffold(
      appBar: AppBar(title: Text(track.title)),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              track.title,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(track.artist, style: TextStyle(color: Colors.grey[600])),
            const SizedBox(height: 24),
            ElevatedButton.icon(
              onPressed: () {
                if (playing) {
                  ref.read(playerProvider.notifier).stop();
                } else {
                  ref.read(playerProvider.notifier).select(track);
                }
              },
              icon: Icon(playing ? Icons.pause : Icons.play_arrow),
              label: Text(playing ? '暂停' : '播放'),
            ),
            const SizedBox(height: 16),
            Text(isCurrent ? (playing ? '正在播放' : '已暂停') : '未播放'),
            if (isCurrent) ...[
              const SizedBox(height: 8),
              Text('${ps.position.inSeconds}s / ${ps.duration.inSeconds}s'),
            ],
          ],
        ),
      ),
    );
  }
}
