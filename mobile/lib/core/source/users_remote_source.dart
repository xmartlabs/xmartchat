import 'dart:async';

import 'package:flutter_template/core/model/user.dart';
import 'package:flutter_template/main.dart';

abstract interface class UsersRemoteSource {
  Stream<List<SupabaseUserResponse>> getUsersStream();
}

class UsersRemoteSourceImpl implements UsersRemoteSource {
  @override
  // TODO: implement getUsersStream
  Stream<List<SupabaseUserResponse>> getUsersStream() => Stream.value([]);
  // @override
  // Stream<List<SupabaseUserResponse>> getUsersStream() => supabaseClient
  //     .from('users')
  //     .stream(primaryKey: ['id']).map(SupabaseUserResponse.fromJsonList);
}
