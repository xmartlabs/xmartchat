## Authentication

[Docs](https://supabase.com/docs/reference/dart/auth-signup)

1. Setup email provider
2. Implament methods to manage the state, sign up, sign in and sign out.

```dart
class AuthRemoteSourceImpl implements AuthRemoteSource {
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
```