import 'package:dartx/dartx.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_template/ui/extensions/context_extensions.dart';
import 'package:flutter_template/ui/home/home_cubit.dart';
import 'package:flutter_template/ui/theme/app_theme.dart';

class HomeOptionsMenu extends StatelessWidget {
  const HomeOptionsMenu({super.key});

  @override
  Widget build(BuildContext context) => PopupMenuButton<_OptionsMenu>(
        padding: const EdgeInsets.all(0),
        icon: const Icon(Icons.more_vert),
        position: PopupMenuPosition.under,
        onSelected: (_OptionsMenu optionMenu) =>
            _onSelectedOption(optionMenu, context),
        itemBuilder: (BuildContext context) => _OptionsMenu.values
            .mapIndexed(
              (index, optionMenu) => PopupMenuItem<_OptionsMenu>(
                padding: const EdgeInsets.all(0),
                value: optionMenu,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  height: 48.h,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              optionMenu.name(context),
                              style: context.theme.textStyles.bodyMedium,
                            ),
                          ],
                        ),
                      ),
                      if (index != _OptionsMenu.values.lastIndex)
                        Container(
                          height: 1.h,
                          color: Colors.white,
                          width: double.infinity,
                        ),
                    ],
                  ),
                ),
              ),
            )
            .toList(),
      );

  Future<void> _onSelectedOption(
    _OptionsMenu optionMenu,
    BuildContext context,
  ) =>
      switch (optionMenu) {
        _OptionsMenu.github => context.read<HomeCubit>().onPressedGitHub(),
        _OptionsMenu.logout => context.read<HomeCubit>().logOut(),
        _OptionsMenu.xmartlabs =>
          context.read<HomeCubit>().onPressedXmartlabs(),
      };
}

enum _OptionsMenu {
  github,
  xmartlabs,
  logout;
}

extension _OptionsMenuExtension on _OptionsMenu {
  String name(BuildContext context) => switch (this) {
        _OptionsMenu.github => context.localizations.menu_option_github,
        _OptionsMenu.logout => context.localizations.menu_option_log_out,
        _OptionsMenu.xmartlabs =>
          context.localizations.menu_option_about_xmartlabs,
      };
}
