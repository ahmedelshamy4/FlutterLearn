import 'package:flutter_learn/initialize_app_config.dart';
import 'package:flutter_learn/simple_posts_data_with_clean_arch/data/Repository/posts_repository_imp.dart';
import 'package:flutter_learn/simple_posts_data_with_clean_arch/domain/domain/posts_repositories.dart';
import 'package:flutter_learn/simple_posts_data_with_clean_arch/domain/use_cases/create_post_use_case.dart';
import 'package:flutter_learn/simple_posts_data_with_clean_arch/domain/use_cases/get_posts_use_case.dart';

class PostsDi {
  PostsDi._();

  static Future<void> initialize() async {
    injector
        .registerLazySingleton<PostsRepositories>(() => PostsRepositoriesImp(
              injector(),
            ));

    injector.registerFactory(() => GetPostsUseCase(injector()));
    injector.registerFactory(() => CreatePostsUseCase(injector()));
  }
}
