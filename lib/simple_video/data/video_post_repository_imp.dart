import 'package:flutter_learn/simple_video/data/data_source/local_video_data_source_imp.dart';
import 'package:flutter_learn/simple_video/domain/entities/video_post.dart';
import 'package:flutter_learn/simple_video/domain/repository/video_post_repository.dart';

class VideoPostRepositoryImp implements VideoPostRepository {
  final LocalVideoDatasourceImp localVideoDatasourceImp;

  VideoPostRepositoryImp(
    this.localVideoDatasourceImp,
  );

  @override
  Future<List<VideoPost>> getTrendingVideosByPage(int page) {
    return localVideoDatasourceImp.getLocalVideosByPage(page);
  }
}
