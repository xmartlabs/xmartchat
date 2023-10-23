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
  Future<void> sendMessage({required String body}) {
    // TODO: implement sendMessage
    throw UnimplementedError();
  }

  // @override
  // Future<void> sendMessage({required String body}) async {
  //   final currentUserId = supabaseClient.auth.currentUser!.id;
  //   return supabaseClient
  //       .from('messages')
  //       .insert({'body': body, 'sender': currentUserId});
  // }
  //

  @override
  // TODO: implement getMessages
  Future<List<UserMessage>> getMessages() async => [];

  // @override
  // Future<List<UserMessage>> getMessages() async {
  //   final currentUserId = supabaseClient.auth.currentUser!.id;
  //   final response = await supabaseClient
  //       .from('messages')
  //       .select('*')
  //       .order('created_at', ascending: true);
  //   return UserMessage.fromResponse(json: response, userId: currentUserId);
  // }
  //
  @override
  Stream<List<Message>> getMessagesStream() async* {
    // TODO: implement getMessagesStream
  }

  // @override
  // Stream<List<Message>> getMessagesStream() => supabaseClient
  //     .from('messages')
  //     .stream(primaryKey: ['id'])
  //     .order('created_at', ascending: true)
  //     .map(Message.fromJsonList);
  //
  @override
  Future<void> uppercaseMessage({required String id}) {
    // TODO: implement uppercaseMessage
    throw UnimplementedError();
  }

  // @override
  // Future<void> uppercaseMessage({required String id}) async {
  //   final response = await supabaseClient.functions.invoke(
  //     'uppercase_message',
  //     body: {'id': id},
  //   );
  //   if (response.status! > 299) {
  //     throw Exception(
  //       'Error calling function: code ${response.status} body ${response.data}',
  //     );
  //   }
  // }
}
