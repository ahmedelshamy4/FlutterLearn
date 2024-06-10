import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_learn/core/di/async.dart';
import 'package:flutter_learn/initialize_app_config.dart';
import 'package:flutter_learn/simple_posts_data_with_clean_arch/domain/use_cases/create_post_use_case.dart';
import 'package:flutter_learn/simple_posts_data_with_clean_arch/domain/use_cases/get_posts_use_case.dart';
import 'package:flutter_learn/simple_posts_data_with_clean_arch/ui/manager/posts_state.dart';

import '../../domain/entities/post_entity.dart';

class PostsCubit extends Cubit<PostsState> {
  late GetPostsUseCase _getPostsUseCase;
  late CreatePostsUseCase _createPostsUseCase;

  PostsCubit() : super(const PostsState.initial()) {
    _getPostsUseCase = injector();
    _createPostsUseCase = injector();
  }

  void onCubitStart() async {
    getAllPostsData();
  }
static PostsCubit get(BuildContext context)=>BlocProvider.of(context);
  void getAllPostsData() async {
    try {
      emit(state.reduce(postsState: const Async.loading()));
      final data = await _getPostsUseCase.execute();
      emit(state.reduce(postsState: Async.success(data)));
    } catch (errorMessage) {
      emit(
        state.reduce(
          errorMesage: errorMessage.toString(),
        ),
      );
    }
  }

  void createPost({required PostEntity input}) async {
    try {
      emit(state.reduce(postsState: const Async.loading()));
      await _createPostsUseCase.execute(input);
      emit(state.reduce(postsState: const Async.successWithoutData()));
    } catch (errorMessage) {
      emit(
        state.reduce(
          errorMesage: errorMessage.toString(),
        ),
      );
    }
  }
}
