import 'dart:async';

import 'package:flutter_template/core/model/authentication_status.dart';
import 'package:flutter_template/core/model/user.dart';
import 'package:flutter_template/core/source/auth_local_source.dart';
import 'package:flutter_template/core/source/auth_remote_source.dart';
import 'package:rxdart/rxdart.dart';
import 'package:supabase_flutter/supabase_flutter.dart' hide User;

class SessionRepository {
  final AuthLocalSource _authLocalSource;
  final AuthRemoteSource _authRemoteSource;
  final SupabaseClient _supabaseClient;

  SessionRepository(
    this._authLocalSource,
    this._authRemoteSource,
    this._supabaseClient,
  );

  Stream<AuthenticationStatus> get status => getUserToken().map(
        (token) => token == null
            ? AuthenticationStatus.unauthenticated
            : AuthenticationStatus.authenticated,
      );

  Stream<String?> getUserToken() => Rx.merge([
        Stream.value(_supabaseClient.auth.currentSession),
        _supabaseClient.auth.onAuthStateChange.map((event) => event.session),
      ]).map((event) => event?.accessToken).distinct();

  Stream<User?> getUserInfo() => _authLocalSource.getUser();

  Future<void> signInUser({
    required String email,
    required String password,
  }) async {
    await _authRemoteSource.signInWithPassword(email, password);
  }

  Future<void> logOut() async {
    await _authLocalSource.saveUserToken(null);
    await _authLocalSource.saveUserInfo(null);
    await _supabaseClient.auth.signOut();
  }
}
