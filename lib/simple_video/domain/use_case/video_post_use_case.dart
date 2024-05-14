import 'package:flutter_learn/simple_video/domain/entities/video_post.dart';
import 'package:flutter_learn/simple_video/domain/repositories/video_post_repository.dart';
class VideoPostUseCase {
  final VideoPostRepository _repository;

  VideoPostUseCase(this._repository);
  Future<List<VideoPostEntity>> execute() async {
    return await _repository.getTrendingVideosByPage();
  }
}
