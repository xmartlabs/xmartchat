import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_template/core/common/extension/stream_future_extensions.dart';
import 'package:flutter_template/core/di/di_provider.dart';
import 'package:flutter_template/core/repository/session_repository.dart';
import 'package:flutter_template/ui/router/app_router.dart';
import 'package:flutter_template/ui/section/error_handler/global_event_handler_cubit.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_up_cubit.freezed.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  final SessionRepository _sessionRepository = DiProvider.get();
  final AppRouter _appRouter = DiProvider.get();

  final GlobalEventHandler _globalEventHandler;

  SignUpCubit(this._globalEventHandler) : super(const SignUpState.state());

  void changeEmail(String email) => emit(state.copyWith(email: email));

  void changePassword(String password) =>
      emit(state.copyWith(password: password));

  void changeUsername(String username) =>
      emit(state.copyWith(username: username));

  Future<void> signUp() => _globalEventHandler.showLoading(
        _sessionRepository
            .signUpUser(
              alias: state.username!,
              email: state.email!,
              password: state.password!,
            )
            .filterSuccess(_globalEventHandler.handleError),
      );

  void onAlreadyHaveAnAccountPressed() => _appRouter.push(const SignInRoute());
}
