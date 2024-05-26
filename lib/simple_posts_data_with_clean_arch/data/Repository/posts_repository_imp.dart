import 'dart:convert';

import 'package:flutter_learn/core/constats/api_constants.dart';
import 'package:flutter_learn/core/constats/dio_helper.dart';
import 'package:flutter_learn/core/constats/errors/exception.dart';
import 'package:flutter_learn/simple_posts_data_with_clean_arch/data/mappper/posts_%20mapper.dart';
import 'package:flutter_learn/simple_posts_data_with_clean_arch/data/models/api_post_model.dart';
import 'package:flutter_learn/simple_posts_data_with_clean_arch/data/models/api_posts_result.dart';
import 'package:flutter_learn/simple_posts_data_with_clean_arch/domain/domain/posts_repositories.dart';
import 'package:flutter_learn/simple_posts_data_with_clean_arch/domain/entities/post_entity.dart';

class PostsRepositoriesImp implements PostsRepositories {
  final DioHelper dioHelper;

  PostsRepositoriesImp(this.dioHelper);

  @override
  Future<List<PostEntity>> getAllPosts() {
    // TODO: implement getAllPosts
    throw UnimplementedError();
  }


  // @override
  // Future<List<PostEntity>> getAllPosts() async {
  //   final response = await dioHelper.get(
  //     url: "${ApiConstants.baseUrl}/posts",
  //   );
  //   if (response.statusCode == 200) {
  //     final List<dynamic> decodedJson = json.decode(response.data) as List;
  //     final List<PostModel> posts = decodedJson
  //         .map<PostModel>((postModel) => PostModel.fromJson(postModel))
  //         .toList();
  //     return Future.value(posts);
  //   } else {
  //     throw ServerException(
  //         "Failed to fetch data. Status code: ${response.statusCode}");
  //   }
  // }
}
