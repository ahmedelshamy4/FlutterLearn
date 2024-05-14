import 'package:flutter_learn/simple_video/di/video_posts_injector.dart';
import 'package:get_it/get_it.dart';

final injector = GetIt.instance;

Future<void> init() async {
  VideoPostsDi.initialize();
}
