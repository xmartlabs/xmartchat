## Project Setup

1. Add the dependency `flutter pub add supabase_flutter`
2. Create [Xmartchat Supabase project](https://supabase.com/dashboard)
3. Initialize Supabase in your app

```dart
late SupabaseClient supabaseClient;

Future<void> _initSupabase() async {
  await Supabase.initialize(
    url: 'YOUR_SUPABASE_URL',
    anonKey: 'YOUR_SUPABASE_ANON_KEY',
  );
  supabaseClient = Supabase.instance.client;
}

```
