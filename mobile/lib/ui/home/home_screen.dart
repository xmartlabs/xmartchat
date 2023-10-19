import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_template/core/model/user_message.dart';
import 'package:flutter_template/gen/assets.gen.dart';
import 'package:flutter_template/ui/extensions/context_extensions.dart';
import 'package:flutter_template/ui/home/home_options_menu.dart';
import 'package:flutter_template/ui/section/error_handler/global_event_handler_cubit.dart';
import 'package:flutter_template/ui/theme/app_theme.dart';
import 'package:flutter_template/ui/home/home_cubit.dart';
import 'package:flutter_template/ui/widgets/design_system/text_fields/input_text.dart';
import 'package:flutter_template/ui/widgets/message_box.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (context) => HomeCubit(context.read<GlobalEventHandlerCubit>()),
        child: _HomeContentScreen(),
      );
}

class _HomeContentScreen extends StatefulWidget {
  @override
  State<_HomeContentScreen> createState() => _HomeContentScreenState();
}

class _HomeContentScreenState extends State<_HomeContentScreen> {
  final _textController = TextEditingController();

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => BlocBuilder<HomeCubit, HomeBaseState>(
        builder: (context, state) => Scaffold(
          backgroundColor: context.theme.colors.background.shade500,
          appBar: AppBar(
            leading: Assets.logoAndName.image(width: 143.w),
            leadingWidth: 160.w,
            backgroundColor: context.theme.colors.background.shade500,
            actions: const [HomeOptionsMenu()],
          ),
          body: Column(
            children: [
              Expanded(
                child: state.messages.isEmpty
                    ? const _EmptyStateSection()
                    : _MessagesSection(messages: state.messages),
              ),
              _TextFieldSection(textController: _textController),
              SizedBox(height: 24.h),
            ],
          ),
        ),
      );
}

class _EmptyStateSection extends StatelessWidget {
  const _EmptyStateSection();

  @override
  Widget build(BuildContext context) => LayoutBuilder(
        builder: (context, constraints) => RefreshIndicator(
          onRefresh: () => context.read<HomeCubit>().refreshMessages(),
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: Container(
              height: constraints.maxHeight,
              decoration: BoxDecoration(
                color: context.theme.colors.background.shade400,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Assets.sendGreen.image(height: 40.h),
                      Text(
                        context.localizations.home_empty_state,
                        textAlign: TextAlign.center,
                        style: context.theme.textStyles.titleMedium?.copyWith(
                          color: context.theme.colors.primary.shade300,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      );
}

class _MessagesSection extends StatelessWidget {
  final List<UserMessage> messages;

  const _MessagesSection({
    required this.messages,
  });

  @override
  Widget build(BuildContext context) => RefreshIndicator(
        onRefresh: () => context.read<HomeCubit>().refreshMessages(),
        child: Container(
          decoration: BoxDecoration(
            color: context.theme.colors.background.shade400,
          ),
          child: ListView.builder(
            physics: const AlwaysScrollableScrollPhysics(),
            itemCount: messages.length,
            itemBuilder: (context, index) {
              final userMessage = messages[index];
              return MessageBox(
                userMessage: userMessage,
                uppercaseMessage: context.read<HomeCubit>().uppercaseMessage,
              );
            },
          ),
        ),
      );
}

class _TextFieldSection extends StatelessWidget {
  final TextEditingController textController;

  const _TextFieldSection({required this.textController});

  @override
  Widget build(BuildContext context) => Container(
        padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 16.w),
        child: Column(
          children: [
            AppTextInputField(
              controller: textController,
              maxLines: 3,
              minLines: 1,
              trailingIcon: (textController.text != "")
                  ? IconButton(
                      disabledColor: Colors.grey,
                      icon: Icon(
                        Icons.send,
                        color: context.theme.colors.textColor.shade100,
                      ),
                      color: context.theme.colors.primary.shade300,
                      onPressed: () {
                        context.read<HomeCubit>().sendMessage();
                        textController.clear();
                        context.read<HomeCubit>().onCurrentTextChanged("");
                      },
                    )
                  : null,
              onChanged: context.read<HomeCubit>().onCurrentTextChanged,
              labelText: context.localizations.home_text_field,
            ),
            SizedBox(height: 20.h),
            Assets.xlLogoSmall.image(height: 16.h),
          ],
        ),
      );
}
