import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_learn/simple_video/presentaion/manager/video_post_cubit.dart';
import 'package:flutter_learn/simple_video/presentaion/manager/video_post_state.dart';
import 'package:flutter_learn/simple_video/presentaion/widget/video_buttons_widget.dart';
import 'package:video_player/video_player.dart';

class VideoScrollablePage extends StatelessWidget {
  const VideoScrollablePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => VideoPostCubit()..onCubitCreated(),
      child: const _VideoPageBuilder(),
    );
  }
}

class _VideoPageBuilder extends StatelessWidget {
  const _VideoPageBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Video List'),
      ),
      body: SafeArea(
        child: BlocConsumer<VideoPostCubit, VideoPostState>(
          listener: (context, state) {},
          builder: (context, state) {
            if (state.postsState.isLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state.postsState.isFailure) {
              return Center(
                child: Text(state.errorMessage ?? 'Something went wrong'),
              );
            } else if (state.postsState.isSuccess) {
              final videoPost = state.postsState.data;
              if (videoPost != null) {
                return PageView.builder(
                  scrollDirection: Axis.vertical,
                  physics: const BouncingScrollPhysics(),
                  itemCount: videoPost.length,
                  itemBuilder: (context, index) {
                    return Stack(
                      children: [
                        SizedBox.expand(
                          child: FullScreenPlayer(
                            des: videoPost[index].description,
                            videoUrl: videoPost[index].videoUrl,
                          ),
                        ),
                        VideoButtonsWidget(video: videoPost[index]),
                      ],
                    );
                  },
                );
              }
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}

class FullScreenPlayer extends StatefulWidget {
  final String videoUrl;
  final String des;

  const FullScreenPlayer({
    super.key,
    required this.videoUrl,
    required this.des,
  });

  @override
  State<FullScreenPlayer> createState() => _FullScreenPlayerState();
}

class _FullScreenPlayerState extends State<FullScreenPlayer> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    _controller = VideoPlayerController.asset(widget.videoUrl)
      ..setVolume(0)
      ..setLooping(true)
      ..play();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _controller.initialize(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
              child: CircularProgressIndicator(
                strokeWidth: 2,
              ));
        }
        return GestureDetector(
          onTap: () {
            if (_controller.value.isPlaying) {
              _controller.pause();
              return;
            }
            _controller.play();
          },
          child: AspectRatio(
            aspectRatio: _controller.value.aspectRatio,
            child: Stack(children: [
              VideoPlayer(_controller),
              Positioned(
                  bottom: 50,
                  left: 20,
                  child: _VideoDescription(
                    desc: widget.des,
                  ))
            ]),
          ),
        );
      },
    );
  }
}

class _VideoDescription extends StatelessWidget {
  final String desc;

  const _VideoDescription({required this.desc});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.6,
      child: Text(
        desc,
        maxLines: 2,
        style: Theme.of(context).textTheme.titleLarge,
      ),
    );
  }
}
