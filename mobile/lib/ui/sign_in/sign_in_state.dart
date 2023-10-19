part of 'sign_in_cubit.dart';

@freezed
class SignInBaseState with _$SignInBaseState {
  const factory SignInBaseState.state({
    String? email,
    String? password,
  }) = SignInState;
}
