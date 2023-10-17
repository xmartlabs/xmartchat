import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_template/ui/home/home_cubit.dart';
import 'package:url_launcher/url_launcher.dart';

enum OptionsMenu {
  github,
  xmartlabs,
  logout;
}

extension OptionsMenuExtension on OptionsMenu {
  String get name => switch (this) {
        OptionsMenu.github => 'GitHub',
        OptionsMenu.logout => 'Log out',
        OptionsMenu.xmartlabs => 'About Xmartlabs'
      };

  Function() onPressed(BuildContext context) => switch (this) {
        OptionsMenu.github => () => launchUrl(
              Uri.parse('https://github.com/xmartlabs/supabase-ws-flutter'),
            ),
        OptionsMenu.logout => () => context.read<HomeCubit>().logOut(),
        OptionsMenu.xmartlabs => () => launchUrl(
              Uri.parse('https://xmartlabs.com/'),
            ),
      };
}
