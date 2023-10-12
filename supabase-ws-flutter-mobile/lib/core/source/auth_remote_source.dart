import 'package:rxdart/rxdart.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract interface class IAuthRemoteSource {
  Stream<String?> getUserToken();
  Future<AuthResponse> signInWithPassword(String email, String password);
  Future<void> signOut();
}

class AuthRemoteSource implements IAuthRemoteSource {
  final SupabaseClient _supabaseClient;

  AuthRemoteSource(this._supabaseClient);

  String get userId => _supabaseClient.auth.currentUser!.id;

  @override
  Stream<String?> getUserToken() => Rx.merge([
        Stream.value(_supabaseClient.auth.currentSession),
        _supabaseClient.auth.onAuthStateChange.map((event) => event.session),
      ]).map((event) => event?.accessToken).distinct();

  @override
  Future<AuthResponse> signInWithPassword(String email, String password) =>
      _supabaseClient.auth.signInWithPassword(email: email, password: password);

  @override
  Future<void> signOut() => _supabaseClient.auth.signOut();
}
