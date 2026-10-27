class Track {
  final String id;
  final String title;
  final String artist;
  final int durationMs;
  final String? albumArt;
  final String? lyric;

  Track({
    required this.id,
    required this.title,
    required this.artist,
    required this.durationMs,
    this.albumArt,
    this.lyric,
  });

  factory Track.fromJson(Map<String, dynamic> json) => Track(
    id: json['id'] as String,
    title: json['title'] as String,
    artist: json['artist'] as String,
    durationMs: json['durationMs'] as int,
    albumArt: json['albumArt'] as String?,
    lyric: json['lyric'] as String?,
  );
}
