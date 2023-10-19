import 'dart:async';

import 'package:flutter_template/core/model/message.dart';
import 'package:flutter_template/core/model/user_message.dart';
import 'package:flutter_template/main.dart';

abstract interface class MessagesRemoteSource {
  Future<List<UserMessage>> getMessages();

  Stream<List<Message>> getMessagesStream();

  Future<void> sendMessage({required String body});

  Future<void> uppercaseMessage({required String id});
}

class MessagesRemoteSourceImpl implements MessagesRemoteSource {
  @override
  Future<List<UserMessage>> getMessages() async {
    final currentUserId = supabaseClient.auth.currentUser!.id;
    final response = await supabaseClient
        .from('messages')
        .select('*, user:sender(id, alias)')
        .order('created_at', ascending: true);
    // Json to UserMessages
    final messageResponse = SupabaseMessageResponse.fromJsonList(response);
    return messageResponse.toUserMessageList(
      userId: currentUserId,
    );
  }

  @override
  Stream<List<Message>> getMessagesStream() => supabaseClient
      .from('messages')
      .stream(primaryKey: ['id'])
      .order('created_at', ascending: true)
      .map(Message.fromJsonList);

  @override
  Future<void> sendMessage({required String body}) async {
    final currentUserId = supabaseClient.auth.currentUser!.id;
    return supabaseClient
        .from('messages')
        .insert({'body': body, 'sender': currentUserId});
  }

  @override
  Future<void> uppercaseMessage({required String id}) =>
      supabaseClient.functions.invoke(
        'uppercase_message',
        body: {'id': id},
      );
}
