// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_message.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserMessage _$UserMessageFromJson(Map<String, dynamic> json) {
  return _UserMessage.fromJson(json);
}

/// @nodoc
mixin _$UserMessage {
  @JsonKey(fromJson: _messageSerializer)
  Message get message => throw _privateConstructorUsedError;
  String get alias => throw _privateConstructorUsedError;
  bool get isFromCurrentUser => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserMessageCopyWith<UserMessage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserMessageCopyWith<$Res> {
  factory $UserMessageCopyWith(
          UserMessage value, $Res Function(UserMessage) then) =
      _$UserMessageCopyWithImpl<$Res, UserMessage>;
  @useResult
  $Res call(
      {@JsonKey(fromJson: _messageSerializer) Message message,
      String alias,
      bool isFromCurrentUser});

  $MessageCopyWith<$Res> get message;
}

/// @nodoc
class _$UserMessageCopyWithImpl<$Res, $Val extends UserMessage>
    implements $UserMessageCopyWith<$Res> {
  _$UserMessageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? alias = null,
    Object? isFromCurrentUser = null,
  }) {
    return _then(_value.copyWith(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as Message,
      alias: null == alias
          ? _value.alias
          : alias // ignore: cast_nullable_to_non_nullable
              as String,
      isFromCurrentUser: null == isFromCurrentUser
          ? _value.isFromCurrentUser
          : isFromCurrentUser // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $MessageCopyWith<$Res> get message {
    return $MessageCopyWith<$Res>(_value.message, (value) {
      return _then(_value.copyWith(message: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_UserMessageCopyWith<$Res>
    implements $UserMessageCopyWith<$Res> {
  factory _$$_UserMessageCopyWith(
          _$_UserMessage value, $Res Function(_$_UserMessage) then) =
      __$$_UserMessageCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(fromJson: _messageSerializer) Message message,
      String alias,
      bool isFromCurrentUser});

  @override
  $MessageCopyWith<$Res> get message;
}

/// @nodoc
class __$$_UserMessageCopyWithImpl<$Res>
    extends _$UserMessageCopyWithImpl<$Res, _$_UserMessage>
    implements _$$_UserMessageCopyWith<$Res> {
  __$$_UserMessageCopyWithImpl(
      _$_UserMessage _value, $Res Function(_$_UserMessage) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? alias = null,
    Object? isFromCurrentUser = null,
  }) {
    return _then(_$_UserMessage(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as Message,
      alias: null == alias
          ? _value.alias
          : alias // ignore: cast_nullable_to_non_nullable
              as String,
      isFromCurrentUser: null == isFromCurrentUser
          ? _value.isFromCurrentUser
          : isFromCurrentUser // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

@JsonSerializable()
class _$_UserMessage implements _UserMessage {
  _$_UserMessage(
      {@JsonKey(fromJson: _messageSerializer) required this.message,
      required this.alias,
      required this.isFromCurrentUser});

  factory _$_UserMessage.fromJson(Map<String, dynamic> json) =>
      _$$_UserMessageFromJson(json);

  @override
  @JsonKey(fromJson: _messageSerializer)
  final Message message;
  @override
  final String alias;
  @override
  final bool isFromCurrentUser;

  @override
  String toString() {
    return 'UserMessage(message: $message, alias: $alias, isFromCurrentUser: $isFromCurrentUser)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserMessage &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.alias, alias) || other.alias == alias) &&
            (identical(other.isFromCurrentUser, isFromCurrentUser) ||
                other.isFromCurrentUser == isFromCurrentUser));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, message, alias, isFromCurrentUser);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UserMessageCopyWith<_$_UserMessage> get copyWith =>
      __$$_UserMessageCopyWithImpl<_$_UserMessage>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserMessageToJson(
      this,
    );
  }
}

abstract class _UserMessage implements UserMessage {
  factory _UserMessage(
      {@JsonKey(fromJson: _messageSerializer) required final Message message,
      required final String alias,
      required final bool isFromCurrentUser}) = _$_UserMessage;

  factory _UserMessage.fromJson(Map<String, dynamic> json) =
      _$_UserMessage.fromJson;

  @override
  @JsonKey(fromJson: _messageSerializer)
  Message get message;
  @override
  String get alias;
  @override
  bool get isFromCurrentUser;
  @override
  @JsonKey(ignore: true)
  _$$_UserMessageCopyWith<_$_UserMessage> get copyWith =>
      throw _privateConstructorUsedError;
}
