import 'package:flutter_learn/simple_video/domain/entities/video_post.dart';

abstract class VideoPostRepository {
  Future<List<VideoPost>> getTrendingVideosByPage(int page);
}
