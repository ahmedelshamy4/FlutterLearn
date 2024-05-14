import 'package:flutter_learn/simple_video/data/data_source/local_video_post_result.dart';
import 'package:flutter_learn/simple_video/data/mapper/video_posts_mapper.dart';
import 'package:flutter_learn/simple_video/data/models/local_video_model.dart';
import 'package:flutter_learn/simple_video/domain/entities/video_post.dart';
import 'package:flutter_learn/simple_video/domain/repositories/video_post_repository.dart';

class VideoPostRepositoryImp implements VideoPostRepository {
  @override
  Future<List<VideoPostEntity>> getTrendingVideosByPage() async {
    await Future.delayed(const Duration(seconds: 2));
    final List<VideoPostEntity> videosPosts =
        videos.map((e) => LocalVideoModel.fromJson(e).mapVideoPost()).toList();
    return videosPosts;
  }
}
