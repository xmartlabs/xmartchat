import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_template/ui/home/home_cubit.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_template/core/common/config.dart';
import 'package:flutter_template/ui/resources.dart';

enum OptionsMenu {
  github,
  xmartlabs,
  logout;
}

extension OptionsMenuExtension on OptionsMenu {
  String get name => switch (this) {
        OptionsMenu.github => Resources.localizations.menu_option_github,
        OptionsMenu.logout => Resources.localizations.menu_option_log_out,
        OptionsMenu.xmartlabs =>
          Resources.localizations.menu_option_about_xmartlabs,
      };

  Function() onPressed(BuildContext context) => switch (this) {
        OptionsMenu.github => () => launchUrl(Uri.parse(Config.gitHubUri)),
        OptionsMenu.logout => () => context.read<HomeCubit>().logOut(),
        OptionsMenu.xmartlabs => () =>
            launchUrl(Uri.parse(Config.xmartLabsUri)),
      };
}
