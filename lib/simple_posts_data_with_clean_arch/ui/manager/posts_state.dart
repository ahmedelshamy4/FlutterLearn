import 'package:equatable/equatable.dart';
import 'package:flutter_learn/core/di/async.dart';
import 'package:flutter_learn/simple_posts_data_with_clean_arch/domain/entities/post_entity.dart';

class PostsState extends Equatable {
  final Async<List<PostEntity>> postsState;
  final Async<void> createState;
  final String? errorMessage;

  const PostsState(
    this.postsState,
    this.createState,
    this.errorMessage,
  );

  const PostsState.initial()
      : this(
          const Async.initial(),
          const Async.initial(),
          null,
        );

  PostsState reduce({
    Async<List<PostEntity>>? postsState,
    Async<void>? createState,
    String? errorMesage,
  }) {
    return PostsState(
      postsState ?? this.postsState,
      createState ?? this.createState,
      errorMessage,
    );
  }

  @override
  List<Object?> get props => [
        postsState,
    createState,
        errorMessage,
      ];
}
