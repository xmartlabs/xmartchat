// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

User _$UserFromJson(Map<String, dynamic> json) {
  return _User.fromJson(json);
}

/// @nodoc
mixin _$User {
  String get email => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserCopyWith<User> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserCopyWith<$Res> {
  factory $UserCopyWith(User value, $Res Function(User) then) =
      _$UserCopyWithImpl<$Res, User>;
  @useResult
  $Res call({String email, String? name});
}

/// @nodoc
class _$UserCopyWithImpl<$Res, $Val extends User>
    implements $UserCopyWith<$Res> {
  _$UserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? name = freezed,
  }) {
    return _then(_value.copyWith(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_UserCopyWith<$Res> implements $UserCopyWith<$Res> {
  factory _$$_UserCopyWith(_$_User value, $Res Function(_$_User) then) =
      __$$_UserCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String email, String? name});
}

/// @nodoc
class __$$_UserCopyWithImpl<$Res> extends _$UserCopyWithImpl<$Res, _$_User>
    implements _$$_UserCopyWith<$Res> {
  __$$_UserCopyWithImpl(_$_User _value, $Res Function(_$_User) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? name = freezed,
  }) {
    return _then(_$_User(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable()
class _$_User implements _User {
  _$_User({required this.email, this.name});

  factory _$_User.fromJson(Map<String, dynamic> json) => _$$_UserFromJson(json);

  @override
  final String email;
  @override
  final String? name;

  @override
  String toString() {
    return 'User(email: $email, name: $name)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_User &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, email, name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UserCopyWith<_$_User> get copyWith =>
      __$$_UserCopyWithImpl<_$_User>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserToJson(
      this,
    );
  }
}

abstract class _User implements User {
  factory _User({required final String email, final String? name}) = _$_User;

  factory _User.fromJson(Map<String, dynamic> json) = _$_User.fromJson;

  @override
  String get email;
  @override
  String? get name;
  @override
  @JsonKey(ignore: true)
  _$$_UserCopyWith<_$_User> get copyWith => throw _privateConstructorUsedError;
}

SupabaseUserResponse _$SupabaseUserResponseFromJson(Map<String, dynamic> json) {
  return _SupabaseUserResponse.fromJson(json);
}

/// @nodoc
mixin _$SupabaseUserResponse {
  String get id => throw _privateConstructorUsedError;
  String get alias => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SupabaseUserResponseCopyWith<SupabaseUserResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SupabaseUserResponseCopyWith<$Res> {
  factory $SupabaseUserResponseCopyWith(SupabaseUserResponse value,
          $Res Function(SupabaseUserResponse) then) =
      _$SupabaseUserResponseCopyWithImpl<$Res, SupabaseUserResponse>;
  @useResult
  $Res call({String id, String alias});
}

/// @nodoc
class _$SupabaseUserResponseCopyWithImpl<$Res,
        $Val extends SupabaseUserResponse>
    implements $SupabaseUserResponseCopyWith<$Res> {
  _$SupabaseUserResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? alias = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      alias: null == alias
          ? _value.alias
          : alias // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SupabaseUserResponseCopyWith<$Res>
    implements $SupabaseUserResponseCopyWith<$Res> {
  factory _$$_SupabaseUserResponseCopyWith(_$_SupabaseUserResponse value,
          $Res Function(_$_SupabaseUserResponse) then) =
      __$$_SupabaseUserResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String alias});
}

/// @nodoc
class __$$_SupabaseUserResponseCopyWithImpl<$Res>
    extends _$SupabaseUserResponseCopyWithImpl<$Res, _$_SupabaseUserResponse>
    implements _$$_SupabaseUserResponseCopyWith<$Res> {
  __$$_SupabaseUserResponseCopyWithImpl(_$_SupabaseUserResponse _value,
      $Res Function(_$_SupabaseUserResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? alias = null,
  }) {
    return _then(_$_SupabaseUserResponse(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      alias: null == alias
          ? _value.alias
          : alias // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

@JsonSerializable()
class _$_SupabaseUserResponse implements _SupabaseUserResponse {
  _$_SupabaseUserResponse({required this.id, required this.alias});

  factory _$_SupabaseUserResponse.fromJson(Map<String, dynamic> json) =>
      _$$_SupabaseUserResponseFromJson(json);

  @override
  final String id;
  @override
  final String alias;

  @override
  String toString() {
    return 'SupabaseUserResponse(id: $id, alias: $alias)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SupabaseUserResponse &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.alias, alias) || other.alias == alias));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, alias);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SupabaseUserResponseCopyWith<_$_SupabaseUserResponse> get copyWith =>
      __$$_SupabaseUserResponseCopyWithImpl<_$_SupabaseUserResponse>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SupabaseUserResponseToJson(
      this,
    );
  }
}

abstract class _SupabaseUserResponse implements SupabaseUserResponse {
  factory _SupabaseUserResponse(
      {required final String id,
      required final String alias}) = _$_SupabaseUserResponse;

  factory _SupabaseUserResponse.fromJson(Map<String, dynamic> json) =
      _$_SupabaseUserResponse.fromJson;

  @override
  String get id;
  @override
  String get alias;
  @override
  @JsonKey(ignore: true)
  _$$_SupabaseUserResponseCopyWith<_$_SupabaseUserResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
