import 'package:flutter_learn/simple_posts_data_with_clean_arch/domain/entities/post_entity.dart';

abstract class PostsRepositories {
  Future<List<PostEntity>> getAllPosts();
}
