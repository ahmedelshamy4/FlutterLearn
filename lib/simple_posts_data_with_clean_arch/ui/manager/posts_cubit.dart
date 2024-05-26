import 'package:bloc/bloc.dart';
import 'package:flutter_learn/core/di/async.dart';
import 'package:flutter_learn/initialize_app_config.dart';
import 'package:flutter_learn/simple_posts_data_with_clean_arch/domain/use_cases/get_posts_use_case.dart';
import 'package:flutter_learn/simple_posts_data_with_clean_arch/ui/manager/posts_state.dart';

class PostsCubit extends Cubit<PostsState> {
  late GetPostsUseCase _getPostsUseCase;

  PostsCubit() : super(const PostsState.initial()) {
    _getPostsUseCase = injector();
  }

  void onCubitStart() async {
    getAllPostsData();
  }

  void getAllPostsData() async {
    try {
      emit(state.reduce(postsState: const Async.loading()));
      final data = await _getPostsUseCase.execute();
      print('data ${data.length}');
      emit(state.reduce(postsState: Async.success(data)));
    } catch (errorMessage) {
      print('===${errorMessage.toString()}');
      emit(
        state.reduce(
          errorMesage: errorMessage.toString(),
        ),
      );
    }
  }
}
