// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserMessage _$$_UserMessageFromJson(Map<String, dynamic> json) =>
    _$_UserMessage(
      message: _messageSerializer(json['message']),
      alias: json['alias'] as String,
      isFromCurrentUser: json['is_from_current_user'] as bool,
    );

Map<String, dynamic> _$$_UserMessageToJson(_$_UserMessage instance) =>
    <String, dynamic>{
      'message': instance.message.toJson(),
      'alias': instance.alias,
      'is_from_current_user': instance.isFromCurrentUser,
    };
