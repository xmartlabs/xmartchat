import 'dart:async';

import 'package:flutter_template/core/model/user.dart';
import 'package:supabase_flutter/supabase_flutter.dart' hide UserResponse;

abstract interface class UsersRemoteSource {
  Stream<List<UserResponse>> getUsersStream();
}

class UsersRemoteSourceImpl implements UsersRemoteSource {
  final SupabaseClient _supabaseClient;

  UsersRemoteSourceImpl(this._supabaseClient);

  @override
  Stream<List<UserResponse>> getUsersStream() =>
      _supabaseClient.from('users').stream(primaryKey: ['id']).map(
        (response) => UserResponse.fromJsonList(response),
      );
}
