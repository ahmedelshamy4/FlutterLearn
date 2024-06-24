import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_learn/core/common.dart';
import 'package:flutter_learn/core/theme/colors.dart';
import 'package:flutter_learn/simple_posts_data_with_clean_arch/domain/entities/post_entity.dart';
import 'package:flutter_learn/simple_posts_data_with_clean_arch/ui/create_or_update_post/create_or_update_post_page.dart';
import 'package:flutter_learn/simple_posts_data_with_clean_arch/ui/manager/posts_cubit.dart';
import 'package:flutter_learn/simple_posts_data_with_clean_arch/ui/manager/posts_state.dart';
import 'package:flutter_learn/simple_posts_data_with_clean_arch/ui/widgets/post_item_widget.dart';

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
  PostEntity? post;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarUtil(
        title: "Post Page",
      ),
      body: BlocConsumer<PostsCubit, PostsState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state.postsState.isLoading) {
            return const LoadingUtil();
          } else if (state.postsState.isFailure) {
            return ErrorMessageWidget(
                message: state.postsState.errorMessage.toString());
          } else if (state.postsState.isSuccess) {
            post = state.postsState.data as PostEntity?;
            return RefreshIndicator(
              onRefresh: () async {
                context.read<PostsCubit>().onCubitStart();
              },
              child: SafeArea(
                  child: Column(
                children: [
                  Expanded(
                    child: ListView.separated(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      itemBuilder: (context, index) {
                        final item = state.postsState.data?[index];
                        if (item != null) {
                          return PostItemWidget(
                            index: index,
                            postEntity: item,
                          );
                        }
                        return const SizedBox.shrink();
                      },
                      separatorBuilder: (context, index) => const Divider(),
                      itemCount: state.postsState.data?.length ?? 0,
                    ),
                  )
                ],
              )),
            );
          }
          return const SizedBox.shrink();
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.mainColor,
        child: const Icon(
          Icons.add,
          color: AppColors.whiteColor,
          size: 30,
        ),
        onPressed: () => onNavigate(
          context,
          page: BlocProvider.value(
            value: PostsCubit.get(context),
            child: CreateOrUpdatePostPage(
              entity: post!,
              isUpdate: false,
            ),
          ),
        ),
      ),
    );
  }
}
