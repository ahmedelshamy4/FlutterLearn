import 'package:flutter_learn/simple_video/data/data_source/local_video_post.dart';
import 'package:flutter_learn/simple_video/data/data_source/models/local_video_model.dart';
import 'package:flutter_learn/simple_video/domain/data_source/video_post_data_source.dart';
import 'package:flutter_learn/simple_video/domain/entities/video_post.dart';

class LocalVideoDatasourceImp implements VideoPostDatasource {
  @override
  Future<List<VideoPost>> getLocalVideosByPage(int page) async {
    await Future.delayed(const Duration(seconds: 2));
    final List<VideoPost> videosPosts = videos
        .map(
          (e) => LocalVideoModel.fromJson(e).mapVideoPost(),
        )
        .toList();
    return videosPosts;
  }
}
