import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_template/core/common/extension/stream_future_extensions.dart';
import 'package:flutter_template/core/di/di_provider.dart';
import 'package:flutter_template/core/repository/session_repository.dart';
import 'package:flutter_template/ui/router/app_router.dart';
import 'package:flutter_template/ui/section/error_handler/global_event_handler_cubit.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_in_cubit.freezed.dart';

part 'sign_in_state.dart';

class SignInCubit extends Cubit<SignInBaseState> {
  final SessionRepository _sessionRepository = DiProvider.get();
  final AppRouter _appRouter = DiProvider.get();
  final GlobalEventHandler _globalEventHandler;

  SignInCubit(this._globalEventHandler) : super(const SignInBaseState.state());

  void changeEmail(String email) => emit(state.copyWith(email: email));

  void changePassword(String password) =>
      emit(state.copyWith(password: password));

  Future<void> signIn() => _sessionRepository
      .signInUser(email: state.email!, password: state.password!)
      .filterSuccess(_globalEventHandler.handleError);

  void onDontHaveAccountPressed() => _appRouter.back();
}
