import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_template/core/common/extension/date_time_extensions.dart';
import 'package:flutter_template/core/model/user_message.dart';
import 'package:flutter_template/gen/assets.gen.dart';
import 'package:flutter_template/ui/extensions/context_extensions.dart';
import 'package:flutter_template/ui/section/error_handler/global_event_handler_cubit.dart';
import 'package:flutter_template/ui/theme/app_theme.dart';
import 'package:flutter_template/ui/theme/text_styles.dart';
import 'package:flutter_template/ui/home/home_cubit.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (context) =>
            HomeCubit(context.read<GlobalEventHandlerCubit>()),
        child: _WelcomeContentScreen(),
      );
}

class _WelcomeContentScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) =>
      BlocBuilder<HomeCubit, HomeBaseState>(
        builder: (context, state) => Scaffold(
          backgroundColor: context.theme.colors.background.shade500,
          appBar: AppBar(
            leading: Assets.logoAndName.image(width: 143.w),
            leadingWidth: 160.w,
            backgroundColor: context.theme.colors.background.shade500,
            actions: [
              IconButton(
                icon: const Icon(Icons.more_vert),
                color: context.theme.colors.textColor.shade100,
                //TODO: add logic
                onPressed: () => {},
              ),
            ],
          ),
          body: Column(
            children: [
              state.messages.isEmpty
                  ? Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                            color: context.theme.colors.background.shade400),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Assets.sendGreen.image(height: 40.h),
                                Text(
                                  context.localizations.home_empty_state,
                                  textAlign: TextAlign.center,
                                  style: context.theme.textStyles.titleMedium
                                      ?.copyWith(
                                    color:
                                        context.theme.colors.primary.shade300,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    )
                  : Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: context.theme.colors.background.shade400,
                        ),
                        child: ListView.builder(
                          itemCount: state.messages.length,
                          itemBuilder: (context, index) {
                            final userMessage = state.messages[index];
                            return _MessageWidget(userMessage: userMessage);
                          },
                        ),
                      ),
                    ),
              const _TextFieldSection(),
              SizedBox(height: 24.h),
            ],
          ),
        ),
      );
}

class _TextFieldSection extends StatefulWidget {
  const _TextFieldSection();

  @override
  State<_TextFieldSection> createState() => _TextFieldSectionState();
}

class _TextFieldSectionState extends State<_TextFieldSection> {
  final textController = TextEditingController();

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Container(
        padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 16.w),
        child: Column(
          children: [
            TextField(
              controller: textController,
              textInputAction: TextInputAction.newline,
              maxLines: 3,
              minLines: 1,
              decoration: InputDecoration(
                hintText: context.localizations.home_text_field,
                border: OutlineInputBorder(),
                suffixIcon: IconButton(
                  icon: Icon(Icons.send),
                  onPressed: () {
                    context
                        .read<HomeCubit>()
                        .sendMessage(textController.text);
                    textController.clear();
                  },
                ),
              ),
            ),
            SizedBox(height: 20.h),
            Assets.xlLogoSmall.image(height: 16.h),
          ],
        ),
      );
}

class _MessageWidget extends StatelessWidget {
  final UserMessage userMessage;

  const _MessageWidget({
    required this.userMessage,
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
                    Padding(
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
                                    color:
                                        context.theme.colors.primary.shade200,
                                  )
                                  .bold(),
                            ),
                          ),
                        ],
                      ),
                    ),
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
                  if (!userMessage.isFromCurrentUser)
                    InkWell(
                      //TODO: add logic
                      onTap: () => {},
                      child: SizedBox(
                        height: 20.h,
                        width: 60.w,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              context.localizations.home_message_translate,
                              style: context.theme.textStyles.bodyXSmall
                                  .copyWith(
                                    color:
                                        context.theme.colors.textColor.shade200,
                                  )
                                  .links(),
                            ),
                          ],
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      );
}
