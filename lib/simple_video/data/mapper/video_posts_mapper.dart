import 'package:flutter_learn/simple_video/data/models/local_video_model.dart';
import 'package:flutter_learn/simple_video/domain/entities/video_post.dart';

extension ConvertVideoPostEntityToLocalVideoModel on LocalVideoModel {
  VideoPostEntity mapVideoPost() {
    return VideoPostEntity(
      videoUrl: videoUrl,
      description: name,
      likes: likes,
      views: views,
    );
  }
}
