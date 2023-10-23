// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Message _$$_MessageFromJson(Map<String, dynamic> json) => _$_Message(
      id: json['id'] as String,
      body: json['body'] as String,
      sender: json['sender'] as String,
      createdAt: DateTime.parse(json['created_at'] as String),
    );

Map<String, dynamic> _$$_MessageToJson(_$_Message instance) =>
    <String, dynamic>{
      'id': instance.id,
      'body': instance.body,
      'sender': instance.sender,
      'created_at': instance.createdAt.toIso8601String(),
    };

_$_SupabaseMessageResponse _$$_SupabaseMessageResponseFromJson(
        Map<String, dynamic> json) =>
    _$_SupabaseMessageResponse(
      id: json['id'] as String,
      body: json['body'] as String,
      sender: json['sender'] as String,
      createdAt: DateTime.parse(json['created_at'] as String),
      user: _userResponseSerializer(json['user']),
    );

Map<String, dynamic> _$$_SupabaseMessageResponseToJson(
        _$_SupabaseMessageResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'body': instance.body,
      'sender': instance.sender,
      'created_at': instance.createdAt.toIso8601String(),
      'user': instance.user?.toJson(),
    };

_$_MessageRequest _$$_MessageRequestFromJson(Map<String, dynamic> json) =>
    _$_MessageRequest(
      body: json['body'] as String,
      sender: json['sender'] as String,
    );

Map<String, dynamic> _$$_MessageRequestToJson(_$_MessageRequest instance) =>
    <String, dynamic>{
      'body': instance.body,
      'sender': instance.sender,
    };
