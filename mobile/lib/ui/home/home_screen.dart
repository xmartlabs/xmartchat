import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_template/core/model/user_message.dart';
import 'package:flutter_template/gen/assets.gen.dart';
import 'package:flutter_template/ui/extensions/context_extensions.dart';
import 'package:flutter_template/ui/home/home_cubit.dart';
import 'package:flutter_template/ui/home/home_options_menu.dart';
import 'package:flutter_template/ui/section/error_handler/global_event_handler_cubit.dart';
import 'package:flutter_template/ui/theme/app_theme.dart';
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
  final _scrollController = ScrollController();

  @override
  void dispose() {
    _textController.dispose();
    _scrollController.dispose();
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
                    : _MessagesSection(
                        messages: state.messages,
                        scrollController: _scrollController,
                      ),
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

class _MessagesSection extends StatefulWidget {
  final List<UserMessage> messages;
  final ScrollController scrollController;

  const _MessagesSection({
    required this.messages,
    required this.scrollController,
  });

  @override
  State<_MessagesSection> createState() => _MessagesSectionState();
}

class _MessagesSectionState extends State<_MessagesSection> {
  double _messagesHeight = 0;

  void _scrollDown() {
    widget.scrollController.animateTo(
      widget.scrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 100),
      curve: Curves.fastOutSlowIn,
    );
  }

  @override
  void initState() {
    super.initState();

    SchedulerBinding.instance.addPostFrameCallback((_) {
      _scrollDown();
    });
  }

  @override
  void didUpdateWidget(covariant _MessagesSection oldWidget) {
    super.didUpdateWidget(oldWidget);

    _scrollWhenMessagesAreAdded(oldWidget);
  }

  @override
  Widget build(BuildContext context) => LayoutBuilder(
        builder: (context, constrains) {
          _scrollOnReduceSize(constrains);
          return RefreshIndicator(
            onRefresh: () => context.read<HomeCubit>().refreshMessages(),
            child: Container(
              decoration: BoxDecoration(
                color: context.theme.colors.background.shade400,
              ),
              child: ListView.builder(
                physics: const AlwaysScrollableScrollPhysics(),
                controller: widget.scrollController,
                itemCount: widget.messages.length,
                itemBuilder: (context, index) {
                  final userMessage = widget.messages[index];
                  return MessageBox(
                    userMessage: userMessage,
                    uppercaseMessage:
                        context.read<HomeCubit>().uppercaseMessage,
                  );
                },
              ),
            ),
          );
        },
      );

  void _scrollWhenMessagesAreAdded(_MessagesSection oldWidget) {
    if (oldWidget.messages.length < widget.messages.length &&
        (oldWidget.scrollController.offset >=
                oldWidget.scrollController.position.maxScrollExtent ||
            widget.messages.last.isFromCurrentUser)) {
      SchedulerBinding.instance.addPostFrameCallback((_) => _scrollDown());
    }
  }

  void _scrollOnReduceSize(BoxConstraints constrains) {
    final newOffset = _messagesHeight - constrains.maxHeight;
    if (_messagesHeight != 0 &&
        constrains.maxHeight != _messagesHeight &&
        newOffset > 0) {
      SchedulerBinding.instance.addPostFrameCallback(
        (_) => widget.scrollController.jumpTo(
          widget.scrollController.offset + newOffset,
        ),
      );
    }
    _messagesHeight = constrains.maxHeight;
  }
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
              textInputAction: TextInputAction.search,
              onSubmitted: (_) => _submitValue(context),
              maxLines: 3,
              minLines: 1,
              trailingIcon: (textController.text.isNotEmpty)
                  ? IconButton(
                      disabledColor: Colors.grey,
                      icon: Icon(
                        Icons.send,
                        color: context.theme.colors.textColor.shade100,
                      ),
                      color: context.theme.colors.primary.shade300,
                      onPressed: () => _submitValue(context),
                    )
                  : null,
              onChanged: context.read<HomeCubit>().onCurrentTextChanged,
              hintText: context.localizations.home_text_field,
            ),
            SizedBox(height: 20.h),
            Assets.xlLogoSmall.image(height: 16.h),
          ],
        ),
      );

  void _submitValue(BuildContext context) {
    context.read<HomeCubit>().sendMessage();
    textController.clear();
    context.read<HomeCubit>().onCurrentTextChanged("");
  }
}
