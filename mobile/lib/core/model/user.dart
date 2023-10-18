import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';

part 'user.g.dart';

@freezed
class User with _$User {
  @JsonSerializable()
  factory User({
    required String email,
    String? name,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}

@freezed
class UserResponse with _$UserResponse {
  @JsonSerializable()
  factory UserResponse({
    required String id,
    required String alias,
  }) = _UserResponse;

  factory UserResponse.fromJson(Map<String, dynamic> json) =>
      _$UserResponseFromJson(json);

  static List<UserResponse> fromJsonList(List<dynamic> json) =>
      json.map((e) => UserResponse.fromJson(e)).toList();
}
