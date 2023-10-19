import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_template/ui/extensions/context_extensions.dart';
import 'package:flutter_template/ui/section/error_handler/global_event_handler_cubit.dart';
import 'package:flutter_template/ui/theme/app_theme.dart';
import 'package:flutter_template/ui/widgets/design_system/buttons/primary_button.dart';
import 'package:flutter_template/ui/widgets/design_system/text_fields/input_text.dart';
import 'package:flutter_template/ui/sign_in/sign_in_cubit.dart';

import 'package:flutter_template/gen/assets.gen.dart';

@RoutePage()
class SignInScreen extends StatelessWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (context) =>
            SignInCubit(context.read<GlobalEventHandlerCubit>()),
        child: _SignInContentScreen(),
      );
}

class _SignInContentScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) =>
      BlocBuilder<SignInCubit, SignInBaseState>(
        builder: (context, state) => SafeArea(
          child: Scaffold(
            backgroundColor: context.theme.colors.background.shade500,
            body: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 104.h, bottom: 68.h),
                      child: Assets.logoAndNameLarge.image(height: 52.h),
                    ),
                    _SignInForm(),
                    if (context.read<SignInCubit>().state.error.isNotEmpty)
                      Text(
                        context.localizations
                            .error(context.read<SignInCubit>().state.error),
                      ),
                    Row(
                      children: [
                        Expanded(
                          child: AppPrimaryButton.filled(
                            text: context.localizations.sign_in,
                            onPressed: () =>
                                context.read<SignInCubit>().signIn(),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: AppPrimaryButton.ghost(
                            text: context.localizations.dont_have_an_account,
                            onPressed: () => context
                                .read<SignInCubit>()
                                .onDontHaveAccountPressed(),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
}

class _SignInForm extends StatefulWidget {
  @override
  State<_SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<_SignInForm> {
  final _emailTextController = TextEditingController();
  final _passwordTextController = TextEditingController();
  late SignInCubit _signInCubit;

  @override
  void dispose() {
    _emailTextController.dispose();
    _passwordTextController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _signInCubit = context.read<SignInCubit>();
    // TODO: This should be bound
    _emailTextController.text = _signInCubit.state.email ?? '';
    _passwordTextController.text = _signInCubit.state.password ?? '';
  }

  @override
  Widget build(BuildContext context) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: AppTextInputField(
              controller: _emailTextController,
              leadingIcon: Icon(Icons.mail_outline,
                color: context.theme.colors.textColor.shade100,
              ),
              labelText: context.localizations.mail,
              onChanged: (String text) => _signInCubit.changeEmail(text),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: AppTextInputField(
              controller: _passwordTextController,
              leadingIcon: Icon(Icons.key,
                color: context.theme.colors.textColor.shade100,
              ),
              obscureText: true,
              onChanged: (String password) =>
                  _signInCubit.changePassword(password),
              labelText: context.localizations.password,
            ),
          ),
        ],
      );
}
