import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_template/ui/extensions/context_extensions.dart';
import 'package:flutter_template/ui/theme/app_theme.dart';

class AppTextInputField extends StatelessWidget {
  final TextEditingController? controller;
  final int? maxLines;
  final int? minLines;
  final Widget? leadingIcon;
  final Widget? trailingIcon;
  final String? hintText;
  final String? labelText;
  final void Function()? actionSecondIcon;
  final Color? backgroundColor;
  final String? error;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;
  final bool? obscureText;
  final TextInputAction? textInputAction;

  const AppTextInputField({
    Key? key,
    this.controller,
    this.maxLines,
    this.minLines,
    this.leadingIcon,
    this.trailingIcon,
    this.hintText,
    this.labelText,
    this.actionSecondIcon,
    this.backgroundColor,
    this.error,
    this.onChanged,
    this.obscureText,
    this.onSubmitted,
    this.textInputAction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => TextField(
        onChanged: onChanged,
        controller: controller,
        maxLines: maxLines ?? 1,
        minLines: minLines,
        textInputAction: textInputAction,
        onSubmitted: onSubmitted,
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderSide: error == null
                ? BorderSide(color: context.theme.colors.textColor.shade100)
                : BorderSide(color: context.theme.colors.error.shade400),
            borderRadius: BorderRadius.circular(4.r),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: context.theme.colors.textColor.shade400),
            borderRadius: BorderRadius.circular(4.r),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: context.theme.colors.error.shade400),
            borderRadius: BorderRadius.circular(4.r),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: context.theme.colors.error.shade400),
            borderRadius: BorderRadius.circular(4.r),
          ),
          prefixIcon: leadingIcon,
          suffixIcon: trailingIcon,
          labelText: labelText,
          labelStyle: context.theme.textStyles.bodyMedium?.copyWith(
            color: context.theme.colors.textColor.shade300,
          ),
          floatingLabelStyle: context.theme.textStyles.bodySmall?.copyWith(
            color: context.theme.colors.textColor.shade100,
          ),
          hintText: hintText,
          hintStyle: context.theme.textStyles.bodyMedium?.copyWith(
            color: context.theme.colors.textColor.shade300,
          ),
          errorText: error,
          errorStyle: context.theme.textStyles.bodySmall?.copyWith(
            color: context.theme.colors.error.shade300,
          ),
        ),
        style: context.theme.textStyles.bodyMedium?.copyWith(
          color: context.theme.colors.textColor.shade200,
        ),
        obscureText: obscureText ?? false,
      );
}
