class Video {
  String id;
  String title;
  String thumbnailUrl;
  String channel;
  String description;

  Video({
    required this.id,
    required this.title,
    required this.thumbnailUrl,
    required this.channel,
    required this.description,
  });

  factory Video.fromJSON(Map<String, dynamic> json) {
    return Video(
      id: json['id']['videoId'],
      title: json['snippet']['title'],
      thumbnailUrl: json['snippet']['thumbnails']['high']['url'],
      channel: json['snippet']['channelTitle'],
      description: json['snippet']['description'],
    );
  }
}
