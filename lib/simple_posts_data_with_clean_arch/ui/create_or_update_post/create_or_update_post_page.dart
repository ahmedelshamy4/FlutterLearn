import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_learn/core/common.dart';
import 'package:flutter_learn/core/theme/colors.dart';
import 'package:flutter_learn/simple_posts_data_with_clean_arch/domain/entities/post_entity.dart';
import 'package:flutter_learn/simple_posts_data_with_clean_arch/ui/manager/posts_cubit.dart';
import 'package:flutter_learn/simple_posts_data_with_clean_arch/ui/manager/posts_state.dart';

class CreateOrUpdatePostPage extends StatefulWidget {
  final bool isUpdate;
  final PostEntity entity;

  const CreateOrUpdatePostPage({
    super.key,
    required this.entity,
    required this.isUpdate,
  });

  @override
  State<CreateOrUpdatePostPage> createState() => _CreateOrUpdatePostPageState();
}

class _CreateOrUpdatePostPageState extends State<CreateOrUpdatePostPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late TextEditingController _titleController;
  late TextEditingController _bodyController;

  @override
  void initState() {
    if (widget.isUpdate) {
      _titleController = TextEditingController(
        text: widget.entity.title,
      );
      _bodyController = TextEditingController(
        text: widget.entity.body,
      );
    } else {
      _titleController = TextEditingController();
      _bodyController = TextEditingController();
    }

    super.initState();
  }

  void _createOrUpdatePress() {
    if (_formKey.currentState!.validate()) {
      PostsCubit.get(context).createPost(
          input: PostEntity(
        id: 444,
        title: _titleController.text,
        body: _bodyController.text,
      ));
    } else {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarUtil(
        title: "Create Post",
        onTap: () => onPop(context),
      ),
      body: BlocConsumer<PostsCubit, PostsState>(
        listener: (context, state) {
          if (state.createState.isSuccess) {
            showSnackBar(context, message: "isSuccess", color: Colors.green);
          } else if (state.createState.isFailure) {
            showSnackBar(context,
                message: state.createState.errorMessage.toString(),
                color: Colors.green);
          }
        },
        builder: (context, state) {
          return SafeArea(
            child: Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: AppTextFormField(
                        textFontSize: 18.0,
                        controller: _titleController,
                        hint: 'Enter post title',
                        onValidate: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter a post title';
                          } else {
                            return null;
                          }
                        },
                      ),
                    ),
                    AppTextFormField(
                      controller: _bodyController,
                      textColor: AppColors.greyClr,
                      hint: 'Post Body',
                      maxLines: 4,
                      onValidate: (String? value) {
                        if (value == null || value.isEmpty) {
                          return 'Enter post body please !';
                        } else {
                          return null;
                        }
                      },
                    ),
                    const SizedBox(height: 20),
                    ElevatedButtonUtil(
                      onPressed: _createOrUpdatePress,
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.add,
                            size: 22,
                            color: AppColors.whiteColor,
                          ),
                          SizedBox(width: 10),
                          Text(
                            'Create',
                            style: TextStyle(
                              color: AppColors.whiteColor,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
