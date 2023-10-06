import 'package:flutter_template/core/model/user.dart';
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
    @JsonKey(fromJson: _userResponseSerializer) required UserResponse user,
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
