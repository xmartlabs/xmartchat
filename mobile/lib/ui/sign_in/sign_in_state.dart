part of 'sign_in_cubit.dart';

@freezed
class SignInBaseState with _$SignInBaseState {
  const factory SignInBaseState.state({
    required String? email,
    required String? password,
    required String error,
  }) = SignInState;
}

extension SignInBaseStateExtension on SignInBaseState {
  bool get isSignInEnabled =>
      email != null &&
      email!.isNotEmpty &&
      password != null &&
      password!.isNotEmpty;
}
