import 'dart:async';

import 'package:flutter_template/core/model/authentication_status.dart';
import 'package:flutter_template/core/model/user.dart';
import 'package:flutter_template/core/source/auth_local_source.dart';
import 'package:flutter_template/core/source/auth_remote_source.dart';

class SessionRepository {
  final AuthLocalSource _authLocalSource;
  final AuthRemoteSource _authRemoteSource;

  SessionRepository(
    this._authLocalSource,
    this._authRemoteSource,
  );

  Stream<AuthenticationStatus> get status => _authRemoteSource.getUserId().map(
        (userId) => userId == null
            ? AuthenticationStatus.unauthenticated
            : AuthenticationStatus.authenticated,
      );

  Stream<User?> getUserInfo() => _authLocalSource.getUser();

  Future<void> signInUser({
    required String email,
    required String password,
  }) async {
    await _authRemoteSource.signIn(email: email, password: password);
  }

  Future<void> signUpUser({
    required String email,
    required String password,
    required String alias,
  }) async {
    await _authRemoteSource.signUp(
      alias: alias,
      email: email,
      password: password,
    );
  }

  Future<void> logOut() async {
    await _authLocalSource.saveUserToken(null);
    await _authLocalSource.saveUserInfo(null);
    await _authRemoteSource.signOut();
  }
}
