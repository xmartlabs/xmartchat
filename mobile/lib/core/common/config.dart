// ignore_for_file: constant_identifier_names

import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_template/core/common/environments.dart';
import 'package:flutter_template/core/common/extension/string_extensions.dart';
import 'package:flutter_template/core/common/helper/enum_helpers.dart';
import 'package:flutter_template/core/common/helper/env_helper.dart';

interface class Config {
  static const String environmentFolder = 'environments';
  static const String gitHubUri =
      'https://github.com/xmartlabs/supabase-ws-flutter';
  static const String xmartLabsUri = 'https://xmartlabs.com/';
  static const debugMode = kDebugMode;

  static late String supabaseUrl;
  static late String supabaseAnnonKey;

  static final _environment = enumFromString(
        Environments.values,
        const String.fromEnvironment('ENV'),
      ) ??
      Environments.dev;

  static Future<void> initialize() async {
    await _EnvConfig._setupEnv(_environment);
    _initializeEnvVariables();
  }

  static void _initializeEnvVariables() {
    supabaseUrl = _EnvConfig.getEnvVariable(_EnvConfig.ENV_KEY_SUPABASE_URL)!;
    supabaseAnnonKey =
        _EnvConfig.getEnvVariable(_EnvConfig.ENV_KEY_SUPABASE_ANNON_KEY)!;
  }
}

abstract class _EnvConfig {
  static const ENV_KEY_SUPABASE_URL = 'SUPABASE_URL';
  static const ENV_KEY_SUPABASE_ANNON_KEY = 'SUPABASE_ANNON_KEY';

  static const systemEnv = {
    ENV_KEY_SUPABASE_URL: String.fromEnvironment(ENV_KEY_SUPABASE_URL),
    ENV_KEY_SUPABASE_ANNON_KEY:
        String.fromEnvironment(ENV_KEY_SUPABASE_ANNON_KEY),
  };

  static final Map<String, String> _envFileEnv = {};

  static String? getEnvVariable(String key) =>
      _EnvConfig.systemEnv[key].ifNullOrBlank(() => _envFileEnv[key]);

  static Future<void> _setupEnv(Environments env) async {
    _envFileEnv
      ..addAll(await loadEnvs('${Config.environmentFolder}/default.env'))
      ..addAll(await loadEnvs('${env.path}.env'))
      ..addAll(await loadEnvs('${env.path}.private.env'));
  }
}
