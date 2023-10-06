import 'package:flutter_template/core/model/user_message.dart';
import 'package:flutter_template/core/source/messages_remote_source.dart';
import 'package:stock/stock.dart';

class MessagesRepository {
  // ignore: unused_field
  final MessagesRemoteSource _messagesRemoteSource;

  final Stock<dynamic, List<UserMessage>> _messagesStock;
  final Stock<dynamic, List<UserMessage>> _messagesStreamStock;

  MessagesRepository(this._messagesRemoteSource)
      : _messagesStock = Stock(
          fetcher: Fetcher.ofFuture(
            (_) => _messagesRemoteSource.getMessages(),
          ),
          sourceOfTruth: CachedSourceOfTruth(),
        ),
        _messagesStreamStock = Stock(
          fetcher: Fetcher.ofStream(
            (_) => _messagesRemoteSource.getMessagesStream(),
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
