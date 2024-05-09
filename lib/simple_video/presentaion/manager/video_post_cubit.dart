import 'package:bloc/bloc.dart';
import 'package:flutter_learn/core/di/async.dart';
import 'package:flutter_learn/initialize_app_config.dart';
import 'package:flutter_learn/simple_video/domain/use_case/video_post_use_case.dart';
import 'package:flutter_learn/simple_video/presentaion/manager/video_post_state.dart';

class VideoPostCubit extends Cubit<VideoPostState> {
  late VideoPostUseCase _videoPostUseCase;

  VideoPostCubit() : super(const VideoPostState.initial()) {
    _videoPostUseCase = injector();
  }

  void onCubitCreated() {
    getVideoPost(1);
  }

  Future<void> getVideoPost(int page) async {
    emit(state.reduce(postsState: const Async.loading()));
    try {
      final result = await _videoPostUseCase.execute(page);
      emit(state.reduce(postsState: Async.success(result)));
    } catch (failure) {
      emit(state.reduce(
          errorMessage: failure.toString(),
          postsState: Async.failure(failure.toString())));
    }
  }
}
