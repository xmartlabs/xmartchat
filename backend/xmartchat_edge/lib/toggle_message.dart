import 'dart:convert';

import 'package:edge_http_client/edge_http_client.dart';
import 'package:supabase/supabase.dart';
import 'package:supabase_functions/supabase_functions.dart';

void main() {
  final supabaseClient = SupabaseClient(
    Deno.env.get('SUPABASE_URL')!,
    Deno.env.get('SUPABASE_SERVICE_ROLE_KEY')!,
    httpClient: EdgeHttpClient(),
  );

  SupabaseFunctions(fetch: (request) async {
    final dynamic body = await request.json();
    final messageId = body['id'];

    final List<dynamic> messages =
        await supabaseClient.from('messages').select('body').eq('id', messageId);

    var newBody = (messages[0]['body'] as String).toggleCase();
    await supabaseClient
        .from('messages')
        .update({'body': newBody}).eq('id', messageId);

    return Response(jsonEncode({"message": "ok"}), status: 200);
  });
}

extension _StringExtensions on String {
  String toggleCase() => this == toUpperCase() ? toLowerCase() : toUpperCase();
}
