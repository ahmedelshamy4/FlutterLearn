import 'package:flutter_learn/core/constats/data_injector.dart';
import 'package:flutter_learn/simple_posts_data_with_clean_arch/di/posts_injector.dart';
import 'package:flutter_learn/simple_video/di/video_posts_injector.dart';
import 'package:get_it/get_it.dart';

final injector = GetIt.instance;

Future<void> init() async {
  DataDi.initialize();
  PostsDi.initialize();
  VideoPostsDi.initialize();
}
