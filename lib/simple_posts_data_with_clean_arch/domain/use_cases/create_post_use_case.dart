

import 'package:flutter_learn/simple_posts_data_with_clean_arch/domain/domain/posts_repositories.dart';
import 'package:flutter_learn/simple_posts_data_with_clean_arch/domain/entities/post_entity.dart';

class CreatePostsUseCase {
  final PostsRepositories _repositories;

  CreatePostsUseCase(this._repositories);

  Future<void> execute(PostEntity postEntity) async {
    return await _repositories.createPost(postEntity);
  }
}
