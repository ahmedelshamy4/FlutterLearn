import 'package:equatable/equatable.dart';

class VideoPostEntity extends Equatable {
  final String videoUrl;
  final String description;
  final int likes;
  final int views;

  const VideoPostEntity({
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
