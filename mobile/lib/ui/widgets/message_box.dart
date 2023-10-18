import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_template/core/common/extension/date_time_extensions.dart';
import 'package:flutter_template/core/model/message.dart';
import 'package:flutter_template/core/model/user_message.dart';
import 'package:flutter_template/ui/extensions/context_extensions.dart';
import 'package:flutter_template/ui/theme/app_theme.dart';
import 'package:flutter_template/ui/theme/text_styles.dart';

class MessageBox extends StatelessWidget {
  final UserMessage userMessage;
  final void Function(Message) uppercaseMessage;

  const MessageBox({
    required this.userMessage,
    required this.uppercaseMessage,
    super.key,
  });

  @override
  Widget build(BuildContext context) => Padding(
        padding: EdgeInsets.only(top: 10.w, left: 16.w, right: 16.w),
        child: Row(
          mainAxisAlignment: userMessage.isFromCurrentUser
              ? MainAxisAlignment.end
              : MainAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: userMessage.isFromCurrentUser
                    ? CrossAxisAlignment.end
                    : CrossAxisAlignment.start,
                children: [
                  if (!userMessage.isFromCurrentUser)
                    _UserAliasSection(userMessage: userMessage),
                  Container(
                    padding: EdgeInsets.only(
                      right: 12.w,
                      left: 12.w,
                      top: 8.h,
                      bottom: 12.h,
                    ),
                    decoration: BoxDecoration(
                      color: userMessage.isFromCurrentUser
                          ? context.theme.colors.primary.shade900
                          : context.theme.colors.secondary.shade900,
                      borderRadius: BorderRadius.only(
                        topRight: userMessage.isFromCurrentUser
                            ? Radius.zero
                            : Radius.circular(8.r),
                        bottomLeft: Radius.circular(8.r),
                        bottomRight: Radius.circular(8.r),
                        topLeft: userMessage.isFromCurrentUser
                            ? Radius.circular(8.r)
                            : Radius.zero,
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          userMessage.message.body,
                          style: context.theme.textStyles.bodyMedium?.copyWith(
                            color: context.theme.colors.textColor.shade100,
                          ),
                        ),
                        SizedBox(height: 2.h),
                        Text(
                          userMessage.message.createdAt.toAmPmTimeFormat,
                          style: context.theme.textStyles.overline.copyWith(
                            color: context.theme.colors.textColor.shade200,
                          ),
                        ),
                      ],
                    ),
                  ),
                  _UppercaseButton(
                    message: userMessage.message,
                    onTap: uppercaseMessage,
                  ),
                ],
              ),
            ),
          ],
        ),
      );
}

class _UppercaseButton extends StatelessWidget {
  final Message message;
  final void Function(Message) onTap;

  const _UppercaseButton({required this.message, required this.onTap});

  @override
  Widget build(BuildContext context) => InkWell(
        onTap: () => onTap(message),
        child: SizedBox(
          height: 20.h,
          width: 60.w,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                context.localizations.home_message_uppercase,
                style: context.theme.textStyles.bodyXSmall
                    .copyWith(
                      color: context.theme.colors.textColor.shade200,
                    )
                    .links(),
              ),
            ],
          ),
        ),
      );
}

class _UserAliasSection extends StatelessWidget {
  const _UserAliasSection({
    required this.userMessage,
  });

  final UserMessage userMessage;

  @override
  Widget build(BuildContext context) => Padding(
        padding: EdgeInsets.only(
          bottom: 5.h,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: Text(
                userMessage.alias,
                style: context.theme.textStyles.bodySmall
                    ?.copyWith(
                      color: context.theme.colors.primary.shade200,
                    )
                    .bold(),
              ),
            ),
          ],
        ),
      );
}
