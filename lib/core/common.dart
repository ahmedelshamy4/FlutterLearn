import 'package:flutter/material.dart';
import 'package:flutter_learn/core/theme/colors.dart';

AppBar appBarUtil({
  required String title,
  VoidCallback? onTap,
}) =>
    AppBar(
      title: Text(title),
      centerTitle: true,
      leading: (onTap != null)
          ? GestureDetector(
              onTap: onTap,
              behavior: HitTestBehavior.translucent,
              child: const Icon(Icons.arrow_back_ios),
            )
          : null,
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
              style: const TextStyle(
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

void onNavigate(BuildContext context, {required Widget page}) => Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => page),
    );

void onPop(BuildContext context) => Navigator.pop(context);

class AppTextFormField extends StatefulWidget {
  const AppTextFormField({
    Key? key,
    required this.controller,
    required this.hint,
    required this.onValidate,
    this.textColor,
    this.textFontSize,
    this.onChanged,
    this.maxLines = 1,
  }) : super(key: key);

  final TextEditingController controller;
  final String hint;
  final String? Function(String?) onValidate;
  final int maxLines;
  final Color? textColor;
  final double? textFontSize;
  final void Function(String)? onChanged;

  @override
  _AppTextFormFieldState createState() => _AppTextFormFieldState();
}

class _AppTextFormFieldState extends State<AppTextFormField> {
  bool _showError = false;
  String? _errorText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      validator: (value) {
        if (_showError) {
          return widget.onValidate(value);
        }
        return null;
      },
      cursorColor: AppColors.mainColor,
      maxLines: widget.maxLines,
      onChanged: (value) {
        setState(() {
          _showError = false;
        });
        if (widget.onChanged != null) {
          widget.onChanged!(value);
        }
      },
      onFieldSubmitted: (value) {
        setState(() {
          _showError = true;
          _errorText = widget.onValidate(value);
        });
      },
      style: TextStyle(
        color: widget.textColor ?? AppColors.mainColor,
        fontSize: widget.textFontSize ?? 16,
        fontWeight: FontWeight.w600,
      ),
      decoration: InputDecoration(
        hintText: widget.hint,
        hintStyle: const TextStyle(
          color: AppColors.mainColor,
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
        errorText: _showError ? _errorText : null,
        enabledBorder: _border(),
        focusedBorder: _border(),
        errorBorder: _border(),
        focusedErrorBorder: _border(),
      ),
    );
  }

  OutlineInputBorder _border() => const OutlineInputBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(5),
    ),
    borderSide: BorderSide(
      width: 2,
      color: AppColors.mainColor,
    ),
  );
}
void showSnackBar(BuildContext context,
    {required String message, required Color color}) {
  ScaffoldMessenger.of(context)
      .showSnackBar(snackBarWidget(message: message, color: color));
}
SnackBar snackBarWidget({required String message, required Color color}) =>
    SnackBar(
      content: Text(
        message,
        style: const TextStyle(
          color: AppColors.mainColor,
          fontSize: 20,
        ),
      ),
      backgroundColor: color,
    );
class ElevatedButtonUtil extends StatelessWidget {
  const ElevatedButtonUtil({
    Key? key,
    required this.child,
    required this.onPressed,
    this.color = AppColors.mainColor,
  }) : super(key: key);
  final Widget child;
  final Color color;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
            const EdgeInsets.all(10)),
        backgroundColor: MaterialStateProperty.all<Color>(color),
        shape: MaterialStateProperty.all<OutlinedBorder>(
          const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(5),
            ),
          ),
        ),
      ),
      child: child,
    );
  }
}
