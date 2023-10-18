import 'dart:async';

import 'package:flutter_template/core/model/message.dart';
import 'package:flutter_template/core/model/user_message.dart';
import 'package:supabase_flutter/supabase_flutter.dart' hide UserResponse;

abstract interface class MessagesRemoteSource {
  Future<List<UserMessage>> getMessages();

  Stream<List<Message>> getMessagesStream();

  Future<void> sendMessage({required String body});

  Future<void> uppercaseMessage({required String id});
}

class MessagesRemoteSourceImpl implements MessagesRemoteSource {
  final SupabaseClient _supabaseClient;

  MessagesRemoteSourceImpl(this._supabaseClient);

  @override
  Future<List<UserMessage>> getMessages() async {
    final response = await _supabaseClient
        .from('messages')
        .select('*, user:sender(id, alias)')
        .order('created_at', ascending: true);
    final messageResponse = MessageResponse.fromJsonList(response);
    return messageResponse.toUserMessageList(
      userId: _supabaseClient.auth.currentUser!.id,
    );
  }

  @override
  Stream<List<Message>> getMessagesStream() => _supabaseClient
      .from('messages')
      .stream(primaryKey: ['id'])
      .order('created_at', ascending: true)
      .map(Message.fromJsonList);

  @override
  Future<void> sendMessage({required String body}) async {
    final currentUserId = _supabaseClient.auth.currentUser!.id;
    return _supabaseClient
        .from('messages')
        .insert(MessageRequest(body: body, sender: currentUserId).toJson());
  }

  @override
  Future<void> uppercaseMessage({required String id}) =>
      _supabaseClient.functions.invoke(
        'uppercase_message',
        body: {'id': id},
      );
}
