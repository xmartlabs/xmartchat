import 'package:flutter/material.dart';

// Colors name extracted from https://www.color-name.com
@immutable
class AppColors extends ColorScheme {
  @override
  // ignore: overridden_fields
  final MaterialColor primary;
  @override
  // ignore: overridden_fields
  final MaterialColor background;
  @override
  // ignore: overridden_fields
  final MaterialColor error;

  final MaterialColor textColor;
  final MaterialColor info;
  final MaterialColor success;
  final MaterialColor warning;

  const AppColors({
    required this.primary,
    required this.background,
    required this.textColor,
    required this.info,
    required this.success,
    required this.warning,
    required this.error,
    required Brightness brightness,
    required Color onPrimary,
    required Color secondary,
    required Color onSecondary,
    required Color onError,
    required Color onBackground,
    required Color surface,
    required Color onSurface,
    required ColorScheme colorScheme,
  }) : super(
          brightness: brightness,
          primary: primary,
          onPrimary: onPrimary,
          secondary: secondary,
          onSecondary: onSecondary,
          error: error,
          onError: onError,
          background: background,
          onBackground: onBackground,
          surface: surface,
          onSurface: onSurface,
        );

  // ignore: long-method
  static AppColors getColorScheme() => AppColors(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const MaterialColor(
            0x0E9F6F,
            <int, Color>{
              100: Color.fromRGBO(248, 254, 252, 1),
              200: Color.fromRGBO(225, 247, 240, 1),
              300: Color.fromRGBO(178, 233, 215, 1),
              400: Color.fromRGBO(109, 213, 178, 1),
              500: Color.fromRGBO(16, 185, 129, 1),
              600: Color.fromRGBO(14, 159, 111, 1),
              700: Color.fromRGBO(12, 133, 92, 1),
              800: Color.fromRGBO(9, 106, 74, 1),
              900: Color.fromRGBO(7, 80, 55, 1),
              1000: Color.fromRGBO(5, 54, 37, 1),
            },
          ),
        ),
        brightness: Brightness.dark,
        primary: const MaterialColor(
          0x0E9F6F,
          <int, Color>{
            100: Color.fromRGBO(248, 254, 252, 1),
            200: Color.fromRGBO(225, 247, 240, 1),
            300: Color.fromRGBO(178, 233, 215, 1),
            400: Color.fromRGBO(109, 213, 178, 1),
            500: Color.fromRGBO(16, 185, 129, 1),
            600: Color.fromRGBO(14, 159, 111, 1),
            700: Color.fromRGBO(12, 133, 92, 1),
            800: Color.fromRGBO(9, 106, 74, 1),
            900: Color.fromRGBO(7, 80, 55, 1),
            1000: Color.fromRGBO(5, 54, 37, 1),
          },
        ),
        onPrimary: Colors.white,
        secondary: const MaterialColor(
          0xE0E0E0,
          <int, Color>{
            100: Color.fromRGBO(255, 255, 255, 1),
            200: Color.fromRGBO(249, 249, 249, 1),
            300: Color.fromRGBO(243, 243, 243, 1),
            400: Color.fromRGBO(236, 236, 236, 1),
            500: Color.fromRGBO(224, 224, 224, 1),
            600: Color.fromRGBO(191, 191, 191, 1),
            700: Color.fromRGBO(159, 159, 159, 1),
            800: Color.fromRGBO(126, 126, 126, 1),
            900: Color.fromRGBO(61, 61, 61, 1),
            1000: Color.fromRGBO(22, 22, 22, 1),
          },
        ),
        onSecondary: Colors.black,
        background: const MaterialColor(
          0x0B0C0D,
          <int, Color>{
            100: Color.fromRGBO(163, 170, 177, 1),
            200: Color.fromRGBO(138, 145, 153, 1),
            300: Color.fromRGBO(110, 116, 122, 1),
            400: Color.fromRGBO(32, 34, 37, 1),
            500: Color.fromRGBO(11, 12, 13, 1),
          },
        ),
        onBackground: Colors.white,
        surface: Colors.black,
        onSurface: Colors.white,
        textColor: const MaterialColor(
          0xFFFFFF,
          <int, Color>{
            100: Color.fromRGBO(255, 255, 255, 1),
            200: Color.fromRGBO(194, 194, 204, 1),
            300: Color.fromRGBO(138, 138, 168, 1),
            400: Color.fromRGBO(65, 65, 88, 1),
            500: Color.fromRGBO(29, 22, 22, 1),
          },
        ),
        success: const MaterialColor(
          0x10B981,
          <int, Color>{
            100: Color.fromRGBO(231, 248, 242, 1),
            200: Color.fromRGBO(159, 227, 205, 1),
            300: Color.fromRGBO(16, 185, 129, 1),
            400: Color.fromRGBO(13, 148, 103, 1),
            500: Color.fromRGBO(10, 111, 77, 1),
          },
        ),
        info: const MaterialColor(
          0x1169F7,
          <int, Color>{
            100: Color.fromRGBO(207, 232, 254, 1),
            200: Color.fromRGBO(111, 176, 252, 1),
            300: Color.fromRGBO(17, 105, 247, 1),
            400: Color.fromRGBO(8, 60, 177, 1),
            500: Color.fromRGBO(3, 29, 118, 1),
          },
        ),
        warning: const MaterialColor(
          0xF59E0B,
          <int, Color>{
            100: Color.fromRGBO(254, 245, 231, 1),
            200: Color.fromRGBO(251, 216, 157, 1),
            300: Color.fromRGBO(245, 158, 11, 1),
            400: Color.fromRGBO(196, 126, 9, 1),
            500: Color.fromRGBO(153, 119, 15, 1),
          },
        ),
        error: const MaterialColor(
          0xF4444,
          <int, Color>{
            100: Color.fromRGBO(253, 236, 236, 1),
            200: Color.fromRGBO(249, 180, 180, 1),
            300: Color.fromRGBO(239, 68, 68, 1),
            400: Color.fromRGBO(191, 54, 54, 1),
            500: Color.fromRGBO(143, 41, 41, 1),
          },
        ),
        onError: Colors.black,
      );
}

// ignore: unused-code
extension MaterialExtensions on MaterialColor {
  Color get shade1000 => this[1000]!;
}
