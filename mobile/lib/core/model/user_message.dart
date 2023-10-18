import 'package:flutter_template/core/model/message.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_message.freezed.dart';

part 'user_message.g.dart';

@freezed
class UserMessage with _$UserMessage {
  @JsonSerializable()
  factory UserMessage({
    @JsonKey(fromJson: _messageSerializer) required Message message,
    required String alias,
    required bool isFromCurrentUser,
  }) = _UserMessage;

  factory UserMessage.fromJson(Map<String, dynamic> json) =>
      _$UserMessageFromJson(json);

  static List<UserMessage> fromJsonList(List<dynamic> json) =>
      json.map((e) => UserMessage.fromJson(e)).toList();
}

Message _messageSerializer(dynamic data) => Message.fromJson(data);
