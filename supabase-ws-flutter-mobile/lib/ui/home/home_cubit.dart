import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_template/core/common/extension/stream_future_extensions.dart';
import 'package:flutter_template/core/di/di_provider.dart';
import 'package:flutter_template/core/model/message.dart';
import 'package:flutter_template/core/model/user_message.dart';
import 'package:flutter_template/core/repository/messages_repository.dart';
import 'package:flutter_template/core/repository/session_repository.dart';
import 'package:flutter_template/ui/section/error_handler/global_event_handler_cubit.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_cubit.freezed.dart';
part 'home_state.dart';

class HomeCubit extends Cubit<HomeBaseState> {
  final SessionRepository _sessionRepository = DiProvider.get();
  final MessagesRepository _messagesRepository = DiProvider.get();

  final GlobalEventHandler _globalEventHandler;

  StreamSubscription? _messagesSubscription;

  HomeCubit(this._globalEventHandler) : super(const HomeBaseState.state()) {
    _loadMessages();
  }

  void _loadMessages() {
    _messagesSubscription = _messagesRepository
        .getMessagesStream()
        .filterSuccess(_globalEventHandler.handleError)
        .listen((messages) => emit(state.copyWith(messages: messages)));
  }

  @override
  Future<void> close() async {
    await _messagesSubscription?.cancel();
    await super.close();
  }

  void onCurrentTextChanged(String currentText) =>
      emit(state.copyWith(currentText: currentText));

  Future<void> sendMessage() =>
      _messagesRepository.sendMessage(state.currentText);

  Future<void> uppercaseMessage(Message message) => _messagesRepository
      .uppercaseMessage(message)
      .mapToResult()
      .filterSuccess(_globalEventHandler.handleError);

  Future<void> logOut() => _sessionRepository.logOut().mapToResult();
}
