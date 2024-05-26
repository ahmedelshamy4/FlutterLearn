import 'package:flutter_learn/simple_posts_data_with_clean_arch/data/models/api_posts_result.dart';
import 'package:flutter_learn/simple_posts_data_with_clean_arch/domain/entities/post_entity.dart';

extension ConvertPostEntityToApi on ApiPostResult {
  PostEntity mapPostEntity() {
    return PostEntity(
      userId: userId ?? 0,
      id: id ?? 0,
      title: title ?? "",
      body: body ?? "",
    );
  }
}
