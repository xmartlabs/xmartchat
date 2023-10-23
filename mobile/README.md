<img src="assets/logo_and_name_large.png" width=100%/>

# Workshop: Building a Flutter Application with Supabase

## Workshop Details:

In this workshop, you will learn how to build a cross-platform mobile application using the Flutter framework and integrate it with Supabase, an open-source Firebase alternative.

The workshop will explore:
- Creating a real-time database
- User authentication

## Workshop requirements

To participate on this workshop, the only two requirements you need are having basic knowledge of Flutter and Dart programming and a code editor (e.g., Visual Studio Code, Android Studio, or IntelliJ IDEA) installed in your machine. 

## Workshop 

### Project Setup

[DOCS](https://supabase.com/docs/reference/dart/installing)

1. Add the dependency `flutter pub add supabase_flutter`

2. Initialize Supabase in your app

```dart
Future<SupabaseClient> initSupabase() =>
    Supabase.initialize(
      url: 'YOUR_SUPABASE_URL',
      anonKey: 'YOUR_SUPABASE_ANON_KEY',
    ).then((supabase) => supabase.client);
```

### Authentication

[Docs](https://supabase.com/docs/reference/dart/auth-signup)

```dart
class AuthRemoteSourceImpl implements AuthRemoteSource {
  final SupabaseClient _supabaseClient;

  AuthRemoteSourceImpl(this._supabaseClient);

  @override
  Stream<String?> getUserId() =>
      _supabaseClient.auth.onAuthStateChange
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
```

### Send messages

```dart
class MessagesRemoteSourceImpl implements MessagesRemoteSource {
  final SupabaseClient _supabaseClient;

  MessagesRemoteSourceImpl(this._supabaseClient);

  @override
  Future<void> sendMessage({required String body}) async {
    final currentUserId = _supabaseClient.auth.currentUser!.id;
    return _supabaseClient
        .from('messages')
        .insert(MessageRequest(body: body, sender: currentUserId).toJson());
  }
}

```

### Read messages

```dart
  @override
Future<List<UserMessage>> getMessages() async {
  final response = await _supabaseClient
      .from('messages')
      .select('*')
      .order('created_at', ascending: true);
  final messageResponse = MessageResponse.fromJsonList(response);
  return messageResponse.toUserMessageList(
    userId: _supabaseClient.auth.currentUser!.id,
  );
}
```

#### Read messages with alias



##### Create users table and insert data

Migrate data:
```sql
INSERT INTO
  public.users (id, alias)
SELECT
  id,
  raw_user_meta_data ->> 'alias'
FROM
  auth.users 
ON CONFLICT (id) DO UPDATE
	SET alias = excluded.alias;
```

Add Trigger to update table when a user is registered:

```sql
CREATE OR REPLACE FUNCTION public.handle_new_user()
RETURNS TRIGGER
LANGUAGE plpgsql
SECURITY DEFINER
SET search_path = public
AS $$
BEGIN
  INSERT INTO public.users (id, alias)
  VALUES (new.id, new.raw_user_meta_data->>'alias');
  
  RETURN new;
END;
$$;

CREATE TRIGGER on_auth_user_created
  AFTER INSERT ON auth.users
  FOR EACH ROW EXECUTE PROCEDURE public.handle_new_user();
```

##### Use users table

```dart
 @override
Future<List<UserMessage>> getMessages() async {
  final response = await _supabaseClient
      .from('messages')
      .select('*, user:sender(id, alias)')
      .order('created_at', ascending: true);
  final messageResponse = MessageResponse.fromJsonList(response);
  return messageResponse.toUserMessageList(
    userId: _supabaseClient.auth.currentUser!.id,
  );
}
```

#### Read messages in real time

```dart
  @override
Stream<List<Message>> getMessagesStream() =>
    _supabaseClient
        .from('messages')
        .stream(primaryKey: ['id'])
        .order('created_at', ascending: true)
        .map(Message.fromJsonList);
```

```dart
  @override
  Stream<List<UserResponse>> getUsersStream() => _supabaseClient
      .from('users')
      .stream(primaryKey: ['id']).map(UserResponse.fromJsonList);
```

### Uppercase messages

```ts
// Follow this setup guide to integrate the Deno language server with your editor:
// https://deno.land/manual/getting_started/setup_your_environment
// This enables autocomplete, go to definition, etc.

import { serve } from "https://deno.land/std@0.168.0/http/server.ts"
import { createClient } from "https://esm.sh/@supabase/supabase-js@2.22.0?target=deno";

const supabaseClient = createClient(
  Deno.env.get("SUPABASE_URL") ?? "",
  Deno.env.get("SUPABASE_SERVICE_ROLE_KEY") ?? "",
  {
    global: {
      headers: {
        Authorization: "Bearer " + Deno.env.get("SUPABASE_SERVICE_ROLE_KEY"),
      },
    },
  },
);

serve(async (req) => {
  const { id } = await req.json()

  const { data, error: getBodyError } = await supabaseClient.from("messages").select("body").eq("id", id)

  if (getBodyError != null) {
    return new Response(JSON.stringify({ "message": "Error getting message body" }), { headers: { "Content-Type": "application/json" } },)
  }

  const body = data[0].body

  const capitalizedMessage = body.toUpperCase()

  const { error: updateMessageError } = await supabaseClient.from("messages").update({ body: capitalizedMessage }).eq("id", id)

  if (updateMessageError != null) {
    return new Response(JSON.stringify({ "message": "Error updating message" }), { headers: { "Content-Type": "application/json" } },)
  }


  return new Response(
    JSON.stringify({ "message": "Success" }),
    { headers: { "Content-Type": "application/json" } },
  )
})

```

Invoke function:
```dart
  @override
  Future<void> uppercaseMessage({required String id}) =>
      _supabaseClient.functions.invoke(
        'uppercase_message',
        body: {'id': id},
      );
```


## Join the Xmartlabs Community!
At Xmartlabs we love to share our knowledge through our open source work. Feel free to check out our [GitHub profile](https://github.com/xmartlabs) and contribute in any way you see fit. You can also explore our [blog](https://blog.xmartlabs.com/), where we regularly post new insights and discoveries. See you there!
