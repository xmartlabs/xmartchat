import 'package:rxdart/rxdart.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

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
  final SupabaseClient _supabaseClient;

  AuthRemoteSourceImpl(this._supabaseClient);

  @override
  Stream<String?> getUserId() => _supabaseClient.auth.onAuthStateChange
      .map((event) => event.session)
      .startWith(_supabaseClient.auth.currentSession)
      .map((event) => event?.user.id)
      .distinct();

  @override
  Future<void> signIn({
    required String email,
    required String password,
  }) =>
      _supabaseClient.auth.signInWithPassword(email: email, password: password);

  @override
  Future<void> signUp({
    required String alias,
    required String email,
    required String password,
  }) =>
      _supabaseClient.auth.signUp(
        email: email,
        password: password,
        data: {'alias': alias},
      );

  @override
  Future<void> signOut() => _supabaseClient.auth.signOut();
}
