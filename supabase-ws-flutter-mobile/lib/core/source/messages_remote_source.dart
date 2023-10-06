import 'dart:async';

import 'package:flutter_template/core/model/message.dart';
import 'package:flutter_template/core/model/user.dart';
import 'package:flutter_template/core/model/user_message.dart';
import 'package:rxdart/rxdart.dart';
import 'package:supabase_flutter/supabase_flutter.dart' hide UserResponse;

class MessagesRemoteSource {
  final SupabaseClient _supabaseClient;

  MessagesRemoteSource(this._supabaseClient);

  Future<List<UserMessage>> getMessages() async {
    final response = await _supabaseClient
        .from('messages')
        .select('id, created_at, body, sender, user:sender(id, alias)');
    final messageResponse = MessageResponse.fromJsonList(response);
    return messageResponse
        .map(
          (message) => UserMessage(
            alias: message.user.alias,
            message: Message(
              id: message.id,
              body: message.body,
              sender: message.user.id,
              createdAt: message.createdAt,
            ),
            isFromCurrentUser:
                _supabaseClient.auth.currentUser!.id == message.sender,
          ),
        )
        .toList();
  }

  Stream<List<UserMessage>> getMessagesStream() => Rx.combineLatest2(
          _supabaseClient.from('messages').stream(
            primaryKey: ['id'],
          ).map((messages) => Message.fromJsonList(messages)),
          _supabaseClient.from('users').stream(
            primaryKey: ['id'],
          ).map((users) => UserResponse.fromJsonList(users)),
          (messages, users) {
        final userMap = Map<String, UserResponse>.fromIterable(
          users,
          key: (user) => user.id,
        );
        return messages
            .map(
              (message) => UserMessage(
                alias: userMap[message.sender]!.alias,
                message: message,
                isFromCurrentUser:
                    _supabaseClient.auth.currentUser!.id == message.sender,
              ),
            )
            .toList();
      });

  Future<void> sendMessage(String body) async {
    final currentUserId = _supabaseClient.auth.currentUser!.id;
    return _supabaseClient
        .from('messages')
        .insert(MessageRequest(body: body, sender: currentUserId));
  }
}
