import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_template/ui/extensions/context_extensions.dart';
import 'package:flutter_template/ui/theme/app_theme.dart';

class InputText extends StatelessWidget {
  final TextEditingController? controller;
  final IconData? leadingIcon;
  final IconData? trailingIcon;
  final String? hintText;
  final String? labelText;
  final void Function()? actionSecondIcon;
  final Color? backgroundColor;
  final String? error;
  final Function(String)? onChanged;
  final bool? obscureText;

  const InputText({
    Key? key,
    this.controller,
    this.leadingIcon,
    this.trailingIcon,
    this.hintText,
    this.labelText,
    this.actionSecondIcon,
    this.backgroundColor,
    this.error,
    this.onChanged,
    this.obscureText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => TextField(
        onChanged: onChanged,
        controller: controller,
        decoration: InputDecoration(
          errorText: error,
          focusedBorder: OutlineInputBorder(
            borderSide: error == null
                ? BorderSide(color: context.theme.colors.primary.shade900)
                : BorderSide(color: context.theme.colors.error.shade400),
            borderRadius: BorderRadius.circular(4.r),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: context.theme.colors.primary.shade900),
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
          prefixIcon: Icon(leadingIcon),
          labelText: labelText,
          labelStyle: context.theme.textStyles.bodySmall?.copyWith(
            color: context.theme.colors.onSurface,
          ),
          hintText: hintText,
          hintStyle: context.theme.textStyles.bodySmall?.copyWith(
            color: context.theme.colors.textColor.shade300,
          ),
          errorStyle: context.theme.textStyles.bodySmall?.copyWith(
            color: context.theme.colors.error.shade300,
          ),
        ),
        style: context.theme.textStyles.bodySmall?.copyWith(
          color: context.theme.colors.onSurface,
        ),
        obscureText: obscureText ?? false,
      );
}
