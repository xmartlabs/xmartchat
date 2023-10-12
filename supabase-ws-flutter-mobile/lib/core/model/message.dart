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
class MessageResponse with _$MessageResponse {
  @JsonSerializable()
  factory MessageResponse({
    required String id,
    required String body,
    required String sender,
    required DateTime createdAt,
    @JsonKey(fromJson: _userResponseSerializer) UserResponse? user,
  }) = _MessageResponse;

  factory MessageResponse.fromJson(Map<String, dynamic> json) =>
      _$MessageResponseFromJson(json);

  static List<MessageResponse> fromJsonList(List<dynamic> json) =>
      json.map((e) => MessageResponse.fromJson(e)).toList();
}

UserResponse _userResponseSerializer(dynamic data) =>
    UserResponse.fromJson(data);

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

extension MessageResponseListExtension on List<MessageResponse> {
  List<UserMessage> toUserMessageList({required String userId}) => map(
        (message) => UserMessage(
          alias: message.user?.alias ?? message.sender,
          message: Message(
            id: message.id,
            body: message.body,
            sender: message.sender,
            createdAt: message.createdAt,
          ),
          isFromCurrentUser: userId == message.sender,
        ),
      ).toList();
}

extension MessageListExtension on List<Message> {
  List<UserMessage> toUserMessageList({
    required List<UserResponse> users,
    required String userId,
  }) {
    final userMap = Map<String, UserResponse>.fromIterable(
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
