import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_learn/core/common.dart';
import 'package:flutter_learn/simple_posts_data_with_clean_arch/ui/manager/posts_cubit.dart';
import 'package:flutter_learn/simple_posts_data_with_clean_arch/ui/manager/posts_state.dart';

class PostPage extends StatelessWidget {
  const PostPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PostsCubit()..onCubitStart(),
      child: const _PostPageBody(),
    );
  }
}

class _PostPageBody extends StatefulWidget {
  const _PostPageBody({super.key});

  @override
  State<_PostPageBody> createState() => _PostPageBodyState();
}

class _PostPageBodyState extends State<_PostPageBody> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarUtil(
        showLeading: false,
        title: "Post Page",
      ),
      body: BlocConsumer<PostsCubit, PostsState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state.postsState.isLoading) {
            print('isLoading');
            return const LoadingUtil();
          } else if (state.postsState.isFailure) {
            print('isFailure');
            return ErrorMessageWidget(
                message: state.postsState.errorMessage.toString());
          } else if (state.postsState.isSuccess) {
            print('isSuccess');
            return SafeArea(
                child: Column(
              children: [
                Expanded(
                  child: ListView.separated(
                    itemBuilder: (context, index) {
                      final data = state.postsState.data?[index];
                      return Text(data?.title ?? "");
                    },
                    separatorBuilder: (context, index) => const Divider(),
                    itemCount: state.postsState.data?.length ?? 0,
                  ),
                )
              ],
            ));
          }
          return Container(
            color: Colors.red,
          );
        },
      ),
    );
  }
}
