import 'package:flutter_learn/core/constats/api_constants.dart';
import 'package:flutter_learn/core/constats/dio_helper.dart';
import 'package:flutter_learn/core/constats/errors/exception.dart';
import 'package:flutter_learn/simple_posts_data_with_clean_arch/data/mappper/posts_%20mapper.dart';
import 'package:flutter_learn/simple_posts_data_with_clean_arch/data/models/api_posts_result.dart';
import 'package:flutter_learn/simple_posts_data_with_clean_arch/domain/domain/posts_repositories.dart';
import 'package:flutter_learn/simple_posts_data_with_clean_arch/domain/entities/post_entity.dart';

class PostsRepositoriesImp implements PostsRepositories {
  final DioHelper dioHelper;

  PostsRepositoriesImp(this.dioHelper);

  @override
  Future<List<PostEntity>> getAllPosts() async {
    try {
      final response = await dioHelper.get(
        url: "${ApiConstants.baseUrl}/posts",
      );
      if (response.statusCode == 200) {
        final List<dynamic> data = response.data;
        return data
            .map((e) => ApiPostResult.fromJson(e).mapPostEntity())
            .toList();
      } else {
        throw Exception('Failed to load posts');
      }
    } catch (e) {
      throw ServerException("Failed to fetch data. Status code: $e");
    }
  }

  @override
  Future<void> createPost(PostEntity post) async {
    print('post:${post}');
    final Map<String, dynamic> jsonBody = {
      'title': post.title,
      'body': post.body,
    };
    try {
      final response = await dioHelper.post(
        url: "${ApiConstants.baseUrl}/posts",
        data: jsonBody,
      );
      if (response.statusCode == 201) {
        return;
      } else {
        throw Exception('Failed to load posts');
      }
    } catch (e) {
      throw ServerException("Failed to fetch data. Status code: $e");
    }
  }
}
