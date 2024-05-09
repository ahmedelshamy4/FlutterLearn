import 'package:flutter_learn/simple_video/domain/entities/video_post.dart';

abstract class VideoPostDatasource {
  Future<List<VideoPost>> getLocalVideosByPage(int page);
}
