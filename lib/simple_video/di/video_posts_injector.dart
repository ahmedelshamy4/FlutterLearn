import 'package:flutter_learn/initialize_app_config.dart';
import 'package:flutter_learn/simple_video/data/video_post_repository_imp.dart';
import 'package:flutter_learn/simple_video/domain/repository/video_post_repository.dart';
import 'package:flutter_learn/simple_video/domain/use_case/video_post_use_case.dart';

class VideoPostsDi {
  VideoPostsDi._();

  static Future<void> initialize() async {
    //
    injector.registerLazySingleton<VideoPostRepository>(
      () => VideoPostRepositoryImp(injector()),
    );
    injector.registerFactory(() => VideoPostUseCase(injector()));
  }
}
