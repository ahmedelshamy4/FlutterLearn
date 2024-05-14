class LocalVideoModel {
  final String videoUrl;
  final String name;
  final int likes;
  final int views;

  LocalVideoModel({
    required this.videoUrl,
    required this.name,
    required this.likes,
    required this.views,
  });

  factory LocalVideoModel.fromJson(Map<String, dynamic> json) {
    return LocalVideoModel(
      videoUrl: json['video'],
      name: json['name'],
      likes: json['likes'],
      views: json['views'],
    );
  }
}
