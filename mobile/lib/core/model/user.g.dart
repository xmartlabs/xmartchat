// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_User _$$_UserFromJson(Map<String, dynamic> json) => _$_User(
      email: json['email'] as String,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$$_UserToJson(_$_User instance) => <String, dynamic>{
      'email': instance.email,
      'name': instance.name,
    };

_$_SupabaseUserResponse _$$_SupabaseUserResponseFromJson(
        Map<String, dynamic> json) =>
    _$_SupabaseUserResponse(
      id: json['id'] as String,
      alias: json['alias'] as String,
    );

Map<String, dynamic> _$$_SupabaseUserResponseToJson(
        _$_SupabaseUserResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'alias': instance.alias,
    };
