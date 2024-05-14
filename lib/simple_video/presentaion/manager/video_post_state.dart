import 'package:equatable/equatable.dart';
import 'package:flutter_learn/core/di/async.dart';
import 'package:flutter_learn/simple_video/domain/entities/video_post.dart';

class VideoPostState extends Equatable {
  final Async<List<VideoPostEntity>> postsState;
  final String? errorMessage;

  const VideoPostState(
    this.postsState,
    this.errorMessage,
  );

  const VideoPostState.initial()
      : this(
          const Async.initial(),
          null,
        );

  VideoPostState reduce({
    Async<List<VideoPostEntity>>? postsState,
    String? errorMessage,
  }) {
    return VideoPostState(
      postsState ?? this.postsState,
      errorMessage,
    );
  }

  @override
  List<Object?> get props => [
        postsState,
        errorMessage,
      ];
}
