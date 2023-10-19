import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_template/gen/assets.gen.dart';
import 'package:flutter_template/ui/extensions/context_extensions.dart';
import 'package:flutter_template/ui/section/error_handler/global_event_handler_cubit.dart';
import 'package:flutter_template/ui/sign_up/sign_up_cubit.dart';
import 'package:flutter_template/ui/theme/app_theme.dart';
import 'package:flutter_template/ui/widgets/design_system/buttons/primary_button.dart';
import 'package:flutter_template/ui/widgets/design_system/text_fields/input_text.dart';

@RoutePage()
class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (context) =>
            SignUpCubit(context.read<GlobalEventHandlerCubit>()),
        child: _SignUpContentScreen(),
      );
}

class _SignUpContentScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) => BlocBuilder<SignUpCubit, SignUpState>(
        builder: (context, state) => SafeArea(
          child: Scaffold(
            backgroundColor: context.theme.colors.background.shade500,
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 104.h, bottom: 68.h),
                    child: Assets.logoAndNameLarge.image(height: 52.h),
                  ),
                  _SignUpForm(),
                  if (context.read<SignUpCubit>().state.error?.isNotEmpty ??
                      false)
                    Text(
                      context.localizations.error(
                        context.read<SignUpCubit>().state.error ?? '',
                      ),
                    ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: 32.h,
                      bottom: 4.h,
                      right: 16.w,
                      left: 16.w,
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: AppPrimaryButton.filled(
                            onPressed: () =>
                                context.read<SignUpCubit>().signUp(),
                            text: context.localizations.sign_up,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 30.h),
                    child: AppPrimaryButton.ghost(
                      text:
                          context.localizations.sign_up_already_have_an_account,
                      onPressed: () => context
                          .read<SignUpCubit>()
                          .onAlreadyHaveAnAccountPressed(),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
}

class _SignUpForm extends StatefulWidget {
  @override
  State<_SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<_SignUpForm> {
  final _emailTextController = TextEditingController();
  final _passwordTextController = TextEditingController();
  final _usernameTextController = TextEditingController();
  late SignUpCubit _signUpCubit;

  @override
  void dispose() {
    _emailTextController.dispose();
    _passwordTextController.dispose();
    _usernameTextController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _signUpCubit = context.read<SignUpCubit>();
    _emailTextController.text = _signUpCubit.state.email ?? '';
    _passwordTextController.text = _signUpCubit.state.password ?? '';
    _usernameTextController.text = _signUpCubit.state.username ?? '';
  }

  @override
  Widget build(BuildContext context) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: AppTextInputField(
              controller: _emailTextController,
              leadingIcon: Icon(
                Icons.mail_outline,
                color: context.theme.colors.textColor.shade100,
              ),
              onChanged: (String text) => _signUpCubit.changeEmail(text),
              labelText: context.localizations.sign_up_email_label,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: AppTextInputField(
              obscureText: true,
              leadingIcon: Icon(Icons.key,
                color: context.theme.colors.textColor.shade100,
              ),
              controller: _passwordTextController,
              onChanged: (String password) =>
                  _signUpCubit.changePassword(password),
              labelText: context.localizations.sign_up_password_label,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: AppTextInputField(
              controller: _usernameTextController,
              leadingIcon: Icon(Icons.person_2_outlined,
                color: context.theme.colors.textColor.shade100,
              ),
              onChanged: (String username) =>
                  _signUpCubit.changeUsername(username),
              labelText: context.localizations.sign_up_username_label,
            ),
          ),
        ],
      );
}
