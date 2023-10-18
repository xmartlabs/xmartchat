import 'package:flutter_template/core/model/message.dart';
import 'package:flutter_template/core/model/user_message.dart';
import 'package:flutter_template/core/source/auth_remote_source.dart';
import 'package:flutter_template/core/source/messages_remote_source.dart';
import 'package:flutter_template/core/source/users_remote_source.dart';
import 'package:rxdart/rxdart.dart';

class MessagesRepository {
  static const _useMessageStream = false;

  final MessagesRemoteSource _messagesRemoteSource;
  final UsersRemoteSource _usersRemoteSource;
  final AuthRemoteSource _authRemoteSource;

  MessagesRepository(
    this._messagesRemoteSource,
    this._usersRemoteSource,
    this._authRemoteSource,
  );

  Stream<List<UserMessage>> getMessages() => _useMessageStream
      ? _getMessagesStream()
      : Stream.fromFuture(_getMessages());

  Future<List<UserMessage>> _getMessages() =>
      _messagesRemoteSource.getMessages();

  Stream<List<UserMessage>> _getMessagesStream() => Rx.combineLatest3(
        _messagesRemoteSource.getMessagesStream(),
        _usersRemoteSource.getUsersStream(),
        _authRemoteSource.getUserId(),
        (messages, users, currentUserId) => messages.toUserMessageList(
          users: users,
          userId: currentUserId,
        ),
      );

  Future<void> sendMessage(String body) =>
      _messagesRemoteSource.sendMessage(body: body);

  Future<void> uppercaseMessage(Message message) =>
      _messagesRemoteSource.uppercaseMessage(id: message.id);
}
