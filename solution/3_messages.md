## Send messages

```dart
class MessagesRemoteSourceImpl implements MessagesRemoteSource {
  @override
  Future<void> sendMessage({required String body}) async {
    final currentUserId = supabaseClient.auth.currentUser!.id;
    return supabaseClient
        .from('messages')
        .insert({'body': body, 'sender': currentUserId});
  }
}
```

## Read messages

```dart
  @override
Future<List<UserMessage>> getMessages() async {
  final currentUserId = supabaseClient.auth.currentUser!.id;
  final response = await supabaseClient
      .from('messages')
      .select('*')
      .order('created_at', ascending: true);
  // Json to UserMessages
  final messageResponse = UserMessage.fromResponse(response);
  return messageResponse.toUserMessageList(
    userId: currentUserId,
  );
}
```

### Read messages with alias

#### Create users table and insert data

The following script creates:
- Create users table
- Enable real time to listen the table changes
- Insert current user profiles into users table
- Create a trigger to insert user profile into users table



```sql
-- Create User Table
CREATE TABLE
  public.users (
    id uuid not null,
    created_at timestamp with time zone not null default now(),
    alias text null,
    constraint users_pkey primary key (id),
    constraint users_id_fkey foreign key (id) references auth.users (id)
  ) tablespace pg_default;


-- Enable Realtime
alter
  publication supabase_realtime add table public.users;

-- Insert alias into the new table
INSERT INTO
  public.users (id, alias)
SELECT
  id,
  raw_user_meta_data ->> 'alias'
FROM
  auth.users 
ON CONFLICT (id) DO UPDATE
	SET alias = excluded.alias;


-- Create trigger to insert alias automatically when a new user is created
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

CREATE OR REPLACE TRIGGER on_auth_user_created
  AFTER INSERT ON auth.users
  FOR EACH ROW EXECUTE PROCEDURE public.handle_new_user();
```

#### Use users table

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

### Read messages in real time

Listen for messages changes: 

```dart
  @override
Stream<List<Message>> getMessagesStream() =>
    _supabaseClient
        .from('messages')
        .stream(primaryKey: ['id'])
        .order('created_at', ascending: true)
        .map(Message.fromJsonList);
```

Listen for messages updates: 
```dart
  @override
  Stream<List<UserResponse>> getUsersStream() => _supabaseClient
      .from('users')
      .stream(primaryKey: ['id']).map(UserResponse.fromJsonList);
```

## Uppercase messages

```ts
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
