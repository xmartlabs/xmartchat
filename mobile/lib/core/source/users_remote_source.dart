import 'dart:async';

import 'package:flutter_template/core/model/user.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract interface class UsersRemoteSource {
  Stream<List<SupabaseUserResponse>> getUsersStream();
}

class UsersRemoteSourceImpl implements UsersRemoteSource {
  final SupabaseClient _supabaseClient;

  UsersRemoteSourceImpl(this._supabaseClient);

  @override
  Stream<List<SupabaseUserResponse>> getUsersStream() => _supabaseClient
      .from('users')
      .stream(primaryKey: ['id']).map(SupabaseUserResponse.fromJsonList);
}
