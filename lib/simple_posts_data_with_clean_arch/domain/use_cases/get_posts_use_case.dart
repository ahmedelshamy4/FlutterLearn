import 'package:flutter_learn/simple_posts_data_with_clean_arch/domain/domain/posts_repositories.dart';
import 'package:flutter_learn/simple_posts_data_with_clean_arch/domain/entities/post_entity.dart';

class GetPostsUseCase {
  final PostsRepositories _repositories;

  GetPostsUseCase(this._repositories);

  Future<List<PostEntity>> execute() async {
    return await _repositories.getAllPosts();
  }
}
