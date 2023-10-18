import 'package:flutter_template/core/model/user.dart';
import 'package:rxdart/rxdart.dart';
import 'package:supabase_flutter/supabase_flutter.dart' hide User;

abstract interface class AuthRemoteSource {
  Stream<String?> getUserId();

  Future<User> signIn({
    required String email,
    required String password,
  });

  Future<User> signUp({
    required String alias,
    required String email,
    required String password,
  });

  Future<void> signOut();
}

class AuthRemoteSourceImpl implements AuthRemoteSource {
  final SupabaseClient _supabaseClient;

  AuthRemoteSourceImpl(this._supabaseClient);

  String get userId => _supabaseClient.auth.currentUser!.id;

  @override
  Stream<String?> getUserId() => _supabaseClient.auth.onAuthStateChange
      .map((event) => event.session)
      .startWith(_supabaseClient.auth.currentSession)
      .map((event) => event?.user.id)
      .distinct();

  @override
  Future<User> signIn({
    required String email,
    required String password,
  }) =>
      _supabaseClient.auth
          .signInWithPassword(email: email, password: password)
          .then(
            (authResponse) => User(
              email: authResponse.user!.email!,
              name: authResponse.user?.userMetadata!['alias'] as String,
            ),
          );

  @override
  Future<User> signUp({
    required String alias,
    required String email,
    required String password,
  }) =>
      _supabaseClient.auth.signUp(
        email: email,
        password: password,
        data: {'alias': alias},
      ).then(
        (authResponse) => User(
          email: authResponse.user!.email!,
          name: authResponse.user?.userMetadata!['alias'] as String,
        ),
      );

  @override
  Future<void> signOut() => _supabaseClient.auth.signOut();
}
