import 'package:flutter_learn/simple_posts_data_with_clean_arch/domain/entities/post_entity.dart';

class PostModel extends PostEntity {
  const PostModel({int? userId,int? id, required String title, required String body})
      : super(userId:userId??0,id: id??0, title: title, body: body);

  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
      body: json['body'],
    );
  }
}
