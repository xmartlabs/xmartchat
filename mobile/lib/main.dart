import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_template/core/common/config.dart';
import 'package:flutter_template/core/common/logger.dart';
import 'package:flutter_template/core/di/di_provider.dart';
import 'package:flutter_template/ui/main/main_screen.dart';

// This should be initialized using GetIt but it's here just for
// the example.

// TODO: SupabaseClient sdk initialization
// late SupabaseClient supabaseClient;

Future<void> _initSupabase() async {
  // await Supabase.initialize(
  //   url: Config.supabaseUrl ?? 'YOUR_SUPABASE_URL',
  //   anonKey: Config.supabaseAnnonKey ?? 'YOUR_SUPABASE_ANON_KEY',
  // );
  // supabaseClient = Supabase.instance.client;
}

Future main() async {
  await runZonedGuarded(
    () async {
      final widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
      FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
      await _initSdks();
      runApp(const MyApp());
      FlutterNativeSplash.remove();
    },
    (exception, stackTrace) =>
        Logger.fatal(error: exception, stackTrace: stackTrace),
  );
}

Future _initSdks() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Logger.init();
  await Config.initialize();
  await _initSupabase();

  await Future.wait([
    DiProvider.init(),
    _initFirebaseSdks(),
  ]);
}

// ignore: avoid-redundant-async
Future _initFirebaseSdks() async {
  // TODO: Add Craslytics, Analytics and other sdks that the project needs
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: false,
        splitScreenMode: true,
        builder: (_, __) => const MainScreen(),
      );
}
