import 'dart:async';

import 'package:flutter_template/core/model/message.dart';
import 'package:flutter_template/core/model/user.dart';
import 'package:flutter_template/core/model/user_message.dart';
import 'package:supabase_flutter/supabase_flutter.dart' hide UserResponse;

abstract interface class IMessagesRemoteSource {
  Future<List<UserMessage>> getMessages();
  Stream<List<Message>> getMessagesStream();
  Stream<List<UserResponse>> getUsersStream();
  Future<void> sendMessage(String body);
  Future<void> uppercaseMessage(String id, String body);
}

class MessagesRemoteSource implements IMessagesRemoteSource {
  final SupabaseClient _supabaseClient;

  MessagesRemoteSource(this._supabaseClient);

  @override
  Future<List<UserMessage>> getMessages() async {
    final response = await _supabaseClient
        .from('messages')
        .select('id, created_at, body, sender, user:sender(id, alias)')
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
      .map(
        (response) => Message.fromJsonList(response),
      );

  @override
  Stream<List<UserResponse>> getUsersStream() =>
      _supabaseClient.from('users').stream(primaryKey: ['id']).map(
        (response) => UserResponse.fromJsonList(response),
      );

  @override
  Future<void> sendMessage(String body) async {
    final currentUserId = _supabaseClient.auth.currentUser!.id;
    return _supabaseClient
        .from('messages')
        .insert(MessageRequest(body: body, sender: currentUserId));
  }

  @override
  Future<void> uppercaseMessage(String id, String body) =>
      _supabaseClient.functions
          .invoke('uppercase_message', body: {"id": id, "message": body});
}
