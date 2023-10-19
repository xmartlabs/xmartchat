import 'package:flutter_template/main.dart';
import 'package:rxdart/rxdart.dart';

abstract interface class AuthRemoteSource {
  Stream<String?> getUserId();

  Future<void> signIn({
    required String email,
    required String password,
  });

  Future<void> signUp({
    required String alias,
    required String email,
    required String password,
  });

  Future<void> signOut();
}

class AuthRemoteSourceImpl implements AuthRemoteSource {
  AuthRemoteSourceImpl();

  @override
  Stream<String?> getUserId() => supabaseClient.auth.onAuthStateChange
      .map((event) => event.session)
      .startWith(supabaseClient.auth.currentSession)
      .map((event) => event?.user.id)
      .distinct();

  @override
  Future<void> signIn({
    required String email,
    required String password,
  }) =>
      supabaseClient.auth.signInWithPassword(email: email, password: password);

  @override
  Future<void> signUp({
    required String alias,
    required String email,
    required String password,
  }) =>
      supabaseClient.auth.signUp(
        email: email,
        password: password,
        data: {'alias': alias},
      );

  @override
  Future<void> signOut() => supabaseClient.auth.signOut();
}
