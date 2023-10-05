import 'dart:async';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:flutter_template/core/common/logger.dart';
import 'package:flutter_template/ui/resources.dart';
import 'package:flutter_template/ui/theme/app_theme.dart';
import 'package:flutter_template/ui/widgets/design_system/buttons/base_button.dart';
import 'package:flutter_template/ui/widgets/design_system/buttons/primary_button.dart';

void main() {
  runZonedGuarded(
        () {
      runApp(const MyCatalogApp());
    },
        (exception, stackTrace) =>
        Logger.fatal(error: exception, stackTrace: stackTrace),
  );
}

class MyCatalogApp extends StatelessWidget {
  const MyCatalogApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => ScreenUtilInit(
    designSize: const Size(375, 812),
    minTextAdapt: false,
    splitScreenMode: true,
    builder: (_, __) => _CatalogAppContentScreen(),
  );
}

class _CatalogAppContentScreen extends StatelessWidget {
  const _CatalogAppContentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => MaterialApp(
    home: SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            AppPrimaryButton(
                text: "button", onPressed: () {}, style: StyleButton.filled)
          ],
        ),
      ),
    ),
    builder: (context, child) {
      Resources.setup(context);
      return child!;
    },
    localizationsDelegates: const [
      AppLocalizations.delegate,
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
      GlobalCupertinoLocalizations.delegate,
    ],
    supportedLocales: AppLocalizations.supportedLocales,
    theme: AppTheme.provideAppTheme(context),
  );
}

class CatalogSectionRouter extends StatelessWidget {
  const CatalogSectionRouter({super.key});

  @override
  Widget build(BuildContext context) => const SafeArea(child: AutoRouter());
}
