import 'package:flutter_template/core/repository/messages_repository.dart';
import 'package:flutter_template/core/repository/session_repository.dart';
import 'package:flutter_template/core/source/auth_local_source.dart';
import 'package:flutter_template/core/source/auth_remote_source.dart';
import 'package:flutter_template/core/source/messages_remote_source.dart';
import 'package:get_it/get_it.dart';

class RepositoryDiModule {
  RepositoryDiModule._privateConstructor();

  static final RepositoryDiModule _instance =
      RepositoryDiModule._privateConstructor();

  factory RepositoryDiModule() => _instance;

  void setupModule(GetIt locator) {
    locator
      .._setupSources()
      .._setupRepositories();
  }
}

extension _GetItDiModuleExtensions on GetIt {
  void _setupRepositories() {
    registerLazySingleton(() => MessagesRepository(get(), get()));
    registerLazySingleton(() => SessionRepository(get(), get()));
  }

  void _setupSources() {
    registerLazySingleton(() => AuthLocalSource(get()));
    registerLazySingleton(() => AuthRemoteSource(get()));
    registerLazySingleton(() => MessagesRemoteSource(get()));
  }
}
