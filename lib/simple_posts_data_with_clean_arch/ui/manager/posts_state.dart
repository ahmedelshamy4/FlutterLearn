import 'package:equatable/equatable.dart';
import 'package:flutter_learn/core/di/async.dart';
import 'package:flutter_learn/simple_posts_data_with_clean_arch/domain/entities/post_entity.dart';

class PostsState extends Equatable {
  final Async<List<PostEntity>> postsState;
  final String? errorMessage;

  const PostsState(
    this.postsState,
    this.errorMessage,
  );

  const PostsState.initial()
      : this(
          const Async.initial(),
          null,
        );

  PostsState reduce({
    Async<List<PostEntity>>? postsState,
    String? errorMesage,
  }) {
    return PostsState(
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
