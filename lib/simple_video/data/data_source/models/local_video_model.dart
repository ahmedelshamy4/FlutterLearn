import 'package:flutter_learn/simple_video/domain/entities/video_post.dart';

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

  VideoPost mapVideoPost() {
    return VideoPost(
      videoUrl: videoUrl,
      description: name,
      likes: likes,
      views: views,
    );
  }
}
