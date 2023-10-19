import 'dart:async';

import 'package:flutter_template/core/model/user.dart';
import 'package:flutter_template/main.dart';

abstract interface class UsersRemoteSource {
  Stream<List<UserResponse>> getUsersStream();
}

class UsersRemoteSourceImpl implements UsersRemoteSource {
  UsersRemoteSourceImpl();

  @override
  Stream<List<UserResponse>> getUsersStream() => supabaseClient
      .from('users')
      .stream(primaryKey: ['id']).map(UserResponse.fromJsonList);
}
