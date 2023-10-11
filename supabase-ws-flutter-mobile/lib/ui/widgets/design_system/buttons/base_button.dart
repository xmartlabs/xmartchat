import 'package:flutter_template/ui/extensions/context_extensions.dart';
import 'package:flutter_template/ui/theme/app_theme.dart';
import 'package:flutter_template/ui/theme/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppBaseButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final Color backgroundColor;
  final Color textColor;
  final Color focusColor;
  final Color disabledTextColor;
  final Color pressedColor;
  final Color disabledColor;
  final Color hoveredColor;
  final Color? borderSideColor;
  final Icon? iconLeft;
  final Icon? iconRight;
  final double verticalPadding;

  const AppBaseButton({
    required this.text,
    required this.onPressed,
    required this.backgroundColor,
    required this.textColor,
    required this.disabledColor,
    required this.focusColor,
    required this.pressedColor,
    required this.disabledTextColor,
    required this.hoveredColor,
    this.borderSideColor,
    this.iconLeft,
    this.iconRight,
    this.verticalPadding = 12,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => MaterialButton(
        minWidth: 100.w,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(28.r),
          side: BorderSide(
            width: 2,
            color: borderSideColor ?? Colors.transparent,
          ),
        ),
        elevation: 0.0,
        color: backgroundColor,
        disabledColor: disabledColor,
        disabledTextColor: disabledTextColor,
        highlightColor: pressedColor,
        textColor: textColor,
        onPressed: onPressed,
        hoverColor: hoveredColor,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            if (iconLeft != null)
              Container(
                margin: EdgeInsets.only(right: 16.w),
                child: iconLeft,
              ),
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: verticalPadding.h,
              ),
              child: Text(
                text,
                style: context.theme.textStyles.bodySmall
                    ?.semibold()
                    .copyWith(color: textColor),
              ),
            ),
            if (iconRight != null)
              Container(
                margin: EdgeInsets.only(left: 16.w),
                child: iconRight,
              ),
          ],
        ),
      );
}

enum StyleButton {
  filled,
  stroke,
  ghost,
}
