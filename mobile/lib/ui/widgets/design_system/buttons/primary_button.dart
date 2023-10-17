import 'package:flutter/material.dart';
import 'package:flutter_template/ui/extensions/context_extensions.dart';
import 'package:flutter_template/ui/theme/app_theme.dart';
import 'package:flutter_template/ui/widgets/design_system/buttons/base_button.dart';

class AppPrimaryButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final Icon? iconLeft;
  final Icon? iconRight;
  final StyleButton style;

  const AppPrimaryButton({
    required this.text,
    required this.onPressed,
    required this.style,
    this.iconLeft,
    this.iconRight,
    Key? key,
  }) : super(key: key);

  factory AppPrimaryButton.stroke({
    required String text,
    required VoidCallback? onPressed,
    Icon? iconLeft,
    Icon? iconRight,
  }) =>
      AppPrimaryButton(
        text: text,
        onPressed: onPressed,
        style: StyleButton.stroke,
        iconRight: iconRight,
        iconLeft: iconLeft,
      );

  factory AppPrimaryButton.filled({
    required String text,
    required VoidCallback? onPressed,
    Icon? iconLeft,
    Icon? iconRight,
  }) =>
      AppPrimaryButton(
        text: text,
        onPressed: onPressed,
        style: StyleButton.filled,
        iconRight: iconRight,
        iconLeft: iconLeft,
      );

  factory AppPrimaryButton.ghost({
    required String text,
    required VoidCallback? onPressed,
    Icon? iconLeft,
    Icon? iconRight,
  }) =>
      AppPrimaryButton(
        text: text,
        onPressed: onPressed,
        style: StyleButton.ghost,
        iconRight: iconRight,
        iconLeft: iconLeft,
      );

  @override
  Widget build(BuildContext context) {
    switch (style) {
      case StyleButton.filled:
        return _primaryFilledButton(context);
      case StyleButton.stroke:
        return _primaryStrokeButton(context);
      case StyleButton.ghost:
        return _primaryGhostButton(context);
    }
  }

  AppBaseButton _primaryFilledButton(BuildContext context) => AppBaseButton(
        text: text,
        onPressed: onPressed,
        iconLeft: iconLeft,
        iconRight: iconRight,
        backgroundColor: context.theme.colors.primary.shade500,
        textColor: context.theme.colors.textColor.shade100,
        disabledColor: context.theme.colors.background.shade400,
        disabledTextColor: context.theme.colors.textColor.shade300,
        hoveredColor: context.theme.colors.primary.shade400,
        focusColor: context.theme.colors.primary.shade500,
        pressedColor: context.theme.colors.primary.shade600,
      );

  AppBaseButton _primaryGhostButton(BuildContext context) => AppBaseButton(
        text: text,
        onPressed: onPressed,
        iconLeft: iconLeft,
        iconRight: iconRight,
        backgroundColor: Colors.transparent,
        textColor: context.theme.colors.primary.shade500,
        disabledColor: Colors.transparent,
        disabledTextColor: context.theme.colors.textColor.shade300,
        focusColor: Colors.transparent,
        pressedColor: Colors.transparent,
        hoveredColor: Colors.transparent,
      );

  AppBaseButton _primaryStrokeButton(BuildContext context) => AppBaseButton(
        text: text,
        onPressed: onPressed,
        iconLeft: iconLeft,
        iconRight: iconRight,
        backgroundColor: Colors.transparent,
        textColor: context.theme.colors.primary.shade500,
        disabledColor: Colors.transparent,
        focusColor: Colors.transparent,
        pressedColor: Colors.transparent,
        hoveredColor: Colors.transparent,
        disabledTextColor: context.theme.colors.textColor.shade300,
        borderSideColor: context.theme.colors.primary.shade900,
      );
}
