import 'package:equatable/equatable.dart';

class VideoPost extends Equatable {
  final String videoUrl;
  final String description;
  final int likes;
  final int views;

  const VideoPost({
    required this.videoUrl,
    required this.description,
    this.likes = 0,
    this.views = 0,
  });

  @override
  List<Object> get props => [
        videoUrl,
        description,
        likes,
        views,
      ];
}
