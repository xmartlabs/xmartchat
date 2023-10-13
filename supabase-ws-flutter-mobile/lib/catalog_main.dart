import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:flutter_template/core/common/logger.dart';
import 'package:flutter_template/ui/resources.dart';
import 'package:flutter_template/ui/theme/app_theme.dart';
import 'package:flutter_template/ui/widgets/design_system/buttons/base_button.dart';
import 'package:flutter_template/ui/widgets/design_system/buttons/primary_button.dart';
import 'package:flutter_template/ui/widgets/design_system/text_fields/input_text.dart';

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
        builder: (_, __) => const _CatalogAppContentScreen(),
      );
}

class _CatalogAppContentScreen extends StatefulWidget {
  const _CatalogAppContentScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<_CatalogAppContentScreen> createState() => _CatalogAppContentScreenState();
}

class _CatalogAppContentScreenState extends State<_CatalogAppContentScreen> {
  final _messengerKey = GlobalKey<ScaffoldMessengerState>();

  @override
  Widget build(BuildContext context) => MaterialApp(
        scaffoldMessengerKey: _messengerKey,
        home: SafeArea(
          child: Scaffold(
            body: Padding(
              padding: const EdgeInsets.all(20.0),
              child: ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 6.0),
                    child: AppPrimaryButton(
                      text: 'Filled Button',
                      onPressed: () {
                        _messengerKey.currentState?.showSnackBar(
                            const SnackBar(content: Text('Filled button pressed!')));
                      },
                      style: StyleButton.filled,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 6.0),
                    child: AppPrimaryButton(
                      text: 'Stroke Button',
                      onPressed: () {
                        _messengerKey.currentState?.showSnackBar(
                            const SnackBar(content: Text('Stroke button pressed!')));
                      },
                      style: StyleButton.stroke,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 6.0),
                    child: AppPrimaryButton(
                      text: 'Ghost Button',
                      onPressed: () {
                        _messengerKey.currentState?.showSnackBar(
                            const SnackBar(content: Text('Ghost button pressed!')));
                      },
                      style: StyleButton.ghost,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 16.0),
                    child: AppTextInputField(
                      hintText: 'Write your text...',
                      labelText: 'Label',
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 16.0),
                    child: AppTextInputField(
                      hintText: 'Write your text...',
                      labelText: 'Label',
                      error: 'Error text',
                    ),
                  ),
                ],
              ),
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
