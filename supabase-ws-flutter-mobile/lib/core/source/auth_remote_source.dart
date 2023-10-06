import 'package:flutter_template/core/model/service/auth_models.dart';
import 'package:flutter_template/core/model/service/service_response.dart';
import 'package:flutter_template/core/source/common/http_service.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthRemoteSource {
  final HttpServiceDio _httpService;
  final SupabaseClient _supabaseClient;

  static const _urlLogin = 'auth/v1/token';

  AuthRemoteSource(this._httpService, this._supabaseClient);

  Future<SignInResponse> signIn(String email, String password) async =>
      (await _httpService.postAndProcessResponse(
        _urlLogin,
        queryParameters: {'grant_type': 'password'},
        data: SignInRequest(email: email, password: password).toJson(),
        serializer: (data) => SignInResponse.fromJson(data),
      ))
          .getDataOrThrow();

  Future<AuthResponse> signInWithPassword(String email, String password) =>
      _supabaseClient.auth.signInWithPassword(email: email, password: password);
}
