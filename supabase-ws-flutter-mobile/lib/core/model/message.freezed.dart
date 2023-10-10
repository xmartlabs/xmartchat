// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'message.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Message _$MessageFromJson(Map<String, dynamic> json) {
  return _Message.fromJson(json);
}

/// @nodoc
mixin _$Message {
  String get id => throw _privateConstructorUsedError;
  String get body => throw _privateConstructorUsedError;
  String get sender => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MessageCopyWith<Message> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MessageCopyWith<$Res> {
  factory $MessageCopyWith(Message value, $Res Function(Message) then) =
      _$MessageCopyWithImpl<$Res, Message>;
  @useResult
  $Res call({String id, String body, String sender, DateTime createdAt});
}

/// @nodoc
class _$MessageCopyWithImpl<$Res, $Val extends Message>
    implements $MessageCopyWith<$Res> {
  _$MessageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? body = null,
    Object? sender = null,
    Object? createdAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      body: null == body
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as String,
      sender: null == sender
          ? _value.sender
          : sender // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MessageCopyWith<$Res> implements $MessageCopyWith<$Res> {
  factory _$$_MessageCopyWith(
          _$_Message value, $Res Function(_$_Message) then) =
      __$$_MessageCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String body, String sender, DateTime createdAt});
}

/// @nodoc
class __$$_MessageCopyWithImpl<$Res>
    extends _$MessageCopyWithImpl<$Res, _$_Message>
    implements _$$_MessageCopyWith<$Res> {
  __$$_MessageCopyWithImpl(_$_Message _value, $Res Function(_$_Message) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? body = null,
    Object? sender = null,
    Object? createdAt = null,
  }) {
    return _then(_$_Message(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      body: null == body
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as String,
      sender: null == sender
          ? _value.sender
          : sender // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

@JsonSerializable()
class _$_Message implements _Message {
  _$_Message(
      {required this.id,
      required this.body,
      required this.sender,
      required this.createdAt});

  factory _$_Message.fromJson(Map<String, dynamic> json) =>
      _$$_MessageFromJson(json);

  @override
  final String id;
  @override
  final String body;
  @override
  final String sender;
  @override
  final DateTime createdAt;

  @override
  String toString() {
    return 'Message(id: $id, body: $body, sender: $sender, createdAt: $createdAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Message &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.body, body) || other.body == body) &&
            (identical(other.sender, sender) || other.sender == sender) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, body, sender, createdAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MessageCopyWith<_$_Message> get copyWith =>
      __$$_MessageCopyWithImpl<_$_Message>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MessageToJson(
      this,
    );
  }
}

abstract class _Message implements Message {
  factory _Message(
      {required final String id,
      required final String body,
      required final String sender,
      required final DateTime createdAt}) = _$_Message;

  factory _Message.fromJson(Map<String, dynamic> json) = _$_Message.fromJson;

  @override
  String get id;
  @override
  String get body;
  @override
  String get sender;
  @override
  DateTime get createdAt;
  @override
  @JsonKey(ignore: true)
  _$$_MessageCopyWith<_$_Message> get copyWith =>
      throw _privateConstructorUsedError;
}

MessageResponse _$MessageResponseFromJson(Map<String, dynamic> json) {
  return _MessageResponse.fromJson(json);
}

/// @nodoc
mixin _$MessageResponse {
  String get id => throw _privateConstructorUsedError;
  String get body => throw _privateConstructorUsedError;
  String get sender => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _userResponseSerializer)
  UserResponse? get user => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MessageResponseCopyWith<MessageResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MessageResponseCopyWith<$Res> {
  factory $MessageResponseCopyWith(
          MessageResponse value, $Res Function(MessageResponse) then) =
      _$MessageResponseCopyWithImpl<$Res, MessageResponse>;
  @useResult
  $Res call(
      {String id,
      String body,
      String sender,
      DateTime createdAt,
      @JsonKey(fromJson: _userResponseSerializer) UserResponse? user});

  $UserResponseCopyWith<$Res>? get user;
}

/// @nodoc
class _$MessageResponseCopyWithImpl<$Res, $Val extends MessageResponse>
    implements $MessageResponseCopyWith<$Res> {
  _$MessageResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? body = null,
    Object? sender = null,
    Object? createdAt = null,
    Object? user = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      body: null == body
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as String,
      sender: null == sender
          ? _value.sender
          : sender // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserResponse?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserResponseCopyWith<$Res>? get user {
    if (_value.user == null) {
      return null;
    }

    return $UserResponseCopyWith<$Res>(_value.user!, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_MessageResponseCopyWith<$Res>
    implements $MessageResponseCopyWith<$Res> {
  factory _$$_MessageResponseCopyWith(
          _$_MessageResponse value, $Res Function(_$_MessageResponse) then) =
      __$$_MessageResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String body,
      String sender,
      DateTime createdAt,
      @JsonKey(fromJson: _userResponseSerializer) UserResponse? user});

  @override
  $UserResponseCopyWith<$Res>? get user;
}

/// @nodoc
class __$$_MessageResponseCopyWithImpl<$Res>
    extends _$MessageResponseCopyWithImpl<$Res, _$_MessageResponse>
    implements _$$_MessageResponseCopyWith<$Res> {
  __$$_MessageResponseCopyWithImpl(
      _$_MessageResponse _value, $Res Function(_$_MessageResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? body = null,
    Object? sender = null,
    Object? createdAt = null,
    Object? user = freezed,
  }) {
    return _then(_$_MessageResponse(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      body: null == body
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as String,
      sender: null == sender
          ? _value.sender
          : sender // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserResponse?,
    ));
  }
}

/// @nodoc

@JsonSerializable()
class _$_MessageResponse implements _MessageResponse {
  _$_MessageResponse(
      {required this.id,
      required this.body,
      required this.sender,
      required this.createdAt,
      @JsonKey(fromJson: _userResponseSerializer) this.user});

  factory _$_MessageResponse.fromJson(Map<String, dynamic> json) =>
      _$$_MessageResponseFromJson(json);

  @override
  final String id;
  @override
  final String body;
  @override
  final String sender;
  @override
  final DateTime createdAt;
  @override
  @JsonKey(fromJson: _userResponseSerializer)
  final UserResponse? user;

  @override
  String toString() {
    return 'MessageResponse(id: $id, body: $body, sender: $sender, createdAt: $createdAt, user: $user)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MessageResponse &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.body, body) || other.body == body) &&
            (identical(other.sender, sender) || other.sender == sender) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.user, user) || other.user == user));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, body, sender, createdAt, user);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MessageResponseCopyWith<_$_MessageResponse> get copyWith =>
      __$$_MessageResponseCopyWithImpl<_$_MessageResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MessageResponseToJson(
      this,
    );
  }
}

abstract class _MessageResponse implements MessageResponse {
  factory _MessageResponse(
      {required final String id,
      required final String body,
      required final String sender,
      required final DateTime createdAt,
      @JsonKey(fromJson: _userResponseSerializer)
      final UserResponse? user}) = _$_MessageResponse;

  factory _MessageResponse.fromJson(Map<String, dynamic> json) =
      _$_MessageResponse.fromJson;

  @override
  String get id;
  @override
  String get body;
  @override
  String get sender;
  @override
  DateTime get createdAt;
  @override
  @JsonKey(fromJson: _userResponseSerializer)
  UserResponse? get user;
  @override
  @JsonKey(ignore: true)
  _$$_MessageResponseCopyWith<_$_MessageResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

MessageRequest _$MessageRequestFromJson(Map<String, dynamic> json) {
  return _MessageRequest.fromJson(json);
}

/// @nodoc
mixin _$MessageRequest {
  String get body => throw _privateConstructorUsedError;
  String get sender => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MessageRequestCopyWith<MessageRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MessageRequestCopyWith<$Res> {
  factory $MessageRequestCopyWith(
          MessageRequest value, $Res Function(MessageRequest) then) =
      _$MessageRequestCopyWithImpl<$Res, MessageRequest>;
  @useResult
  $Res call({String body, String sender});
}

/// @nodoc
class _$MessageRequestCopyWithImpl<$Res, $Val extends MessageRequest>
    implements $MessageRequestCopyWith<$Res> {
  _$MessageRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? body = null,
    Object? sender = null,
  }) {
    return _then(_value.copyWith(
      body: null == body
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as String,
      sender: null == sender
          ? _value.sender
          : sender // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MessageRequestCopyWith<$Res>
    implements $MessageRequestCopyWith<$Res> {
  factory _$$_MessageRequestCopyWith(
          _$_MessageRequest value, $Res Function(_$_MessageRequest) then) =
      __$$_MessageRequestCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String body, String sender});
}

/// @nodoc
class __$$_MessageRequestCopyWithImpl<$Res>
    extends _$MessageRequestCopyWithImpl<$Res, _$_MessageRequest>
    implements _$$_MessageRequestCopyWith<$Res> {
  __$$_MessageRequestCopyWithImpl(
      _$_MessageRequest _value, $Res Function(_$_MessageRequest) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? body = null,
    Object? sender = null,
  }) {
    return _then(_$_MessageRequest(
      body: null == body
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as String,
      sender: null == sender
          ? _value.sender
          : sender // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

@JsonSerializable()
class _$_MessageRequest implements _MessageRequest {
  _$_MessageRequest({required this.body, required this.sender});

  factory _$_MessageRequest.fromJson(Map<String, dynamic> json) =>
      _$$_MessageRequestFromJson(json);

  @override
  final String body;
  @override
  final String sender;

  @override
  String toString() {
    return 'MessageRequest(body: $body, sender: $sender)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MessageRequest &&
            (identical(other.body, body) || other.body == body) &&
            (identical(other.sender, sender) || other.sender == sender));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, body, sender);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MessageRequestCopyWith<_$_MessageRequest> get copyWith =>
      __$$_MessageRequestCopyWithImpl<_$_MessageRequest>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MessageRequestToJson(
      this,
    );
  }
}

abstract class _MessageRequest implements MessageRequest {
  factory _MessageRequest(
      {required final String body,
      required final String sender}) = _$_MessageRequest;

  factory _MessageRequest.fromJson(Map<String, dynamic> json) =
      _$_MessageRequest.fromJson;

  @override
  String get body;
  @override
  String get sender;
  @override
  @JsonKey(ignore: true)
  _$$_MessageRequestCopyWith<_$_MessageRequest> get copyWith =>
      throw _privateConstructorUsedError;
}
