import 'dart:async';

import 'package:flutter_template/core/model/message.dart';
import 'package:flutter_template/core/model/user.dart';
import 'package:flutter_template/core/model/user_message.dart';
import 'package:supabase_flutter/supabase_flutter.dart' hide UserResponse;

abstract interface class MessagesRemoteSource {
  Future<List<UserMessage>> getMessages();
  Stream<List<Message>> getMessagesStream();
  Stream<List<UserResponse>> getUsersStream();
  Future<void> sendMessage(String body);
}

class MessagesRemoteSourceImpl implements MessagesRemoteSource {
  final SupabaseClient _supabaseClient;

  MessagesRemoteSourceImpl(this._supabaseClient);

  @override
  Future<List<UserMessage>> getMessages() async {
    final response = await _supabaseClient
        .from('messages')
        .select('id, created_at, body, sender, user:sender(id, alias)');
    final messageResponse = MessageResponse.fromJsonList(response);
    return messageResponse.toUserMessageList(
      userId: _supabaseClient.auth.currentUser!.id,
    );
  }

  @override
  Stream<List<Message>> getMessagesStream() =>
      _supabaseClient.from('messages').stream(primaryKey: ['id']).map(
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
}
