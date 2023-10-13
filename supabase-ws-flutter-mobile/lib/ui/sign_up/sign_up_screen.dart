import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_template/gen/assets.gen.dart';
import 'package:flutter_template/ui/extensions/context_extensions.dart';
import 'package:flutter_template/ui/section/error_handler/global_event_handler_cubit.dart';
import 'package:flutter_template/ui/sign_up/sign_up_cubit.dart';
import 'package:flutter_template/ui/theme/app_theme.dart';

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
            body: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 104.h, bottom: 68.h),
                  child: Assets.logoAndNameLarge.image(height: 52.h),
                ),
                Expanded(child: _SignUpForm()),
                if (context.read<SignUpCubit>().state.error?.isNotEmpty ??
                    false)
                  Text(
                    context.localizations
                        .error(context.read<SignUpCubit>().state.error ?? ''),
                  ),
                Padding(
                  padding: EdgeInsets.only(top: 32.h, bottom: 4.h),
                  child: TextButton(
                    onPressed: () => context.read<SignUpCubit>().signUp(),
                    child: Text(
                      context.localizations.sign_up,
                      style: context.theme.textStyles.bodySmall?.copyWith(
                        color: context.theme.colors.textColor.shade100,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 30.0),
                  child: TextButton(
                    onPressed: () => context
                        .read<SignUpCubit>()
                        .onAlreadyHaveAnAccountPressed(),
                    child: Text(
                      context.localizations.sign_up_already_have_an_account,
                      style: context.theme.textStyles.bodySmall?.copyWith(
                        color: context.theme.colors.textColor.shade100,
                      ),
                    ),
                  ),
                ),
              ],
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
            child: TextField(
              controller: _emailTextController,
              onChanged: (String text) => _signUpCubit.changeEmail(text),
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                labelText: context.localizations.sign_up_email_label,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              obscureText: true,
              controller: _passwordTextController,
              onChanged: (String password) =>
                  _signUpCubit.changePassword(password),
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                labelText: context.localizations.sign_up_password_label,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _usernameTextController,
              onChanged: (String username) =>
                  _signUpCubit.changeUsername(username),
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                labelText: context.localizations.sign_up_username_label,
              ),
            ),
          ),
        ],
      );
}
