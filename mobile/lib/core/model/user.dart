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
class SupabaseUserResponse with _$SupabaseUserResponse {
  @JsonSerializable()
  factory SupabaseUserResponse({
    required String id,
    required String alias,
  }) = _SupabaseUserResponse;

  factory SupabaseUserResponse.fromJson(Map<String, dynamic> json) =>
      _$SupabaseUserResponseFromJson(json);

  static List<SupabaseUserResponse> fromJsonList(List<dynamic> json) =>
      json.map((e) => SupabaseUserResponse.fromJson(e)).toList();
}
