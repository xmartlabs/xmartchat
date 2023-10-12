import 'package:flutter_template/core/model/message.dart';
import 'package:flutter_template/core/model/user_message.dart';
import 'package:flutter_template/core/source/auth_remote_source.dart';
import 'package:flutter_template/core/source/messages_remote_source.dart';
import 'package:rxdart/rxdart.dart';
import 'package:stock/stock.dart';

class MessagesRepository {
  // ignore: unused_field
  final MessagesRemoteSource _messagesRemoteSource;
  // ignore: unused_field
  final AuthRemoteSource _authRemoteSource;

  //TODO: discuss if we should use stock
  final Stock<dynamic, List<UserMessage>> _messagesStock;
  final Stock<dynamic, List<UserMessage>> _messagesStreamStock;

  MessagesRepository(this._messagesRemoteSource, this._authRemoteSource)
      : _messagesStock = Stock(
          fetcher: Fetcher.ofFuture(
            (_) => _messagesRemoteSource.getMessages(),
          ),
          sourceOfTruth: CachedSourceOfTruth(),
        ),
        _messagesStreamStock = Stock(
          fetcher: Fetcher.ofStream(
            (_) => Rx.combineLatest2(
              _messagesRemoteSource.getMessagesStream(),
              _messagesRemoteSource.getUsersStream(),
              (messages, users) => messages.toUserMessageList(
                users: users,
                userId: _authRemoteSource.userId,
              ),
            ),
          ),
          sourceOfTruth: CachedSourceOfTruth(),
        );

  Stream<List<UserMessage>> getMessages() => _messagesStock
      .stream(null)
      .where((event) => event.isData)
      .map((event) => event.requireData());

  Stream<List<UserMessage>> getMessagesStream() => _messagesStreamStock
      .stream(null)
      .where((event) => event.isData)
      .map((event) => event.requireData());

  Future<void> sendMessage(String body) =>
      _messagesRemoteSource.sendMessage(body);
}
