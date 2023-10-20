import 'package:flutter_template/core/model/user.dart';
import 'package:flutter_template/core/model/user_message.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'message.freezed.dart';

part 'message.g.dart';

@freezed
class Message with _$Message {
  @JsonSerializable()
  factory Message({
    required String id,
    required String body,
    required String sender,
    required DateTime createdAt,
  }) = _Message;

  factory Message.fromJson(Map<String, dynamic> json) =>
      _$MessageFromJson(json);

  static List<Message> fromJsonList(List<dynamic> json) =>
      json.map((e) => Message.fromJson(e)).toList();
}

@freezed
class SupabaseMessageResponse with _$SupabaseMessageResponse {
  @JsonSerializable()
  factory SupabaseMessageResponse({
    required String id,
    required String body,
    required String sender,
    required DateTime createdAt,
    @JsonKey(fromJson: _userResponseSerializer) SupabaseUserResponse? user,
  }) = _SupabaseMessageResponse;

  factory SupabaseMessageResponse.fromJson(Map<String, dynamic> json) =>
      _$SupabaseMessageResponseFromJson(json);

  static List<SupabaseMessageResponse> fromJsonList(List<dynamic> json) =>
      json.map((e) => SupabaseMessageResponse.fromJson(e)).toList();
}

SupabaseUserResponse? _userResponseSerializer(dynamic data) =>
    data == null ? null : SupabaseUserResponse.fromJson(data);

@freezed
class MessageRequest with _$MessageRequest {
  @JsonSerializable()
  factory MessageRequest({
    required String body,
    required String sender,
  }) = _MessageRequest;

  factory MessageRequest.fromJson(Map<String, dynamic> json) =>
      _$MessageRequestFromJson(json);
}

extension MessageListExtension on List<Message> {
  List<UserMessage> toUserMessageList({
    required List<SupabaseUserResponse> users,
    required String? userId,
  }) {
    final userMap = Map<String, SupabaseUserResponse>.fromIterable(
      users,
      key: (user) => user.id,
    );
    return map(
      (message) => UserMessage(
        alias: userMap[message.sender]!.alias,
        message: message,
        isFromCurrentUser: userId == message.sender,
      ),
    ).toList();
  }
}
