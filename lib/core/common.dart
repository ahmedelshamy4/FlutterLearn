import 'package:flutter/material.dart';
import 'package:flutter_learn/core/theme/colors.dart';

AppBar appBarUtil({
  required String title,
  bool showLeading = true,
}) =>
    AppBar(
      title: Text(title),
      centerTitle: true,
      leading: showLeading ? const Icon(Icons.arrow_back_ios) : null,
    );

class LoadingUtil extends StatelessWidget {
  const LoadingUtil({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Center(
        child: CircularProgressIndicator.adaptive(
          valueColor: AlwaysStoppedAnimation<Color>(
            AppColors.mainColor,
          ),
        ),
      ),
    );
  }
}
class ErrorMessageWidget extends StatelessWidget {
  const ErrorMessageWidget({Key? key, required this.message}) : super(key: key);
  final String message;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: double.infinity,
          constraints: const BoxConstraints(
            minHeight: 50,
          ),
          margin: const EdgeInsets.all(10),
          decoration: const BoxDecoration(
            color: Colors.redAccent,
            borderRadius: BorderRadius.all(Radius.circular(5)),
          ),
          child: Center(
            child: Text(
              message,
              style:  const TextStyle(
                color: AppColors.whiteColor,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}