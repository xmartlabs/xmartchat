part of 'sign_up_cubit.dart';

@freezed
class SignUpState with _$SignUpState {
  const factory SignUpState.state({
    String? email,
    String? password,
    String? username,
    String? error,
  }) = _SignUpState;
}

extension SignUpStateExtension on SignUpState {
  bool get isSignUpEnabled =>
      email != null &&
      email!.isNotEmpty &&
      password != null &&
      password!.isNotEmpty &&
      username != null &&
      username!.isNotEmpty;
}
