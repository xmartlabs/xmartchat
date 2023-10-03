import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

const FontWeight _semiboldWeight = FontWeight.w500;

class AppStyles extends TextTheme {
  @override
  final TextStyle overline;
  final TextStyle bodyXSmall;

  const AppStyles({
    required this.overline,
    required this.bodyXSmall,
    headlineLarge,
    headlineMedium,
    headlineSmall,
    bodyLarge,
    bodyMedium,
    bodySmall,
    titleLarge,
    titleMedium,
    titleSmall,
    labelLarge,
    labelMedium,
    labelSmall,
  }) : super(
          bodyLarge: bodyLarge,
          headlineMedium: headlineMedium,
          headlineSmall: headlineSmall,
          titleLarge: titleLarge,
          titleMedium: titleMedium,
          titleSmall: titleSmall,
          bodyMedium: bodyMedium,
          bodySmall: bodySmall,
          labelLarge: labelLarge,
          labelSmall: labelSmall,
        );

  factory AppStyles.fromTextTheme({
    required TextStyle overline,
    required TextStyle bodyXSmall,
    required TextTheme textTheme,
  }) =>
      AppStyles(
        headlineSmall: textTheme.headlineSmall,
        headlineMedium: textTheme.headlineMedium,
        headlineLarge: textTheme.headlineLarge,
        bodyLarge: textTheme.bodyLarge,
        bodyMedium: textTheme.bodyMedium,
        bodySmall: textTheme.bodySmall,
        titleLarge: textTheme.titleLarge,
        titleMedium: textTheme.titleMedium,
        titleSmall: textTheme.titleSmall,
        labelLarge: textTheme.labelLarge,
        labelMedium: textTheme.labelMedium,
        labelSmall: textTheme.labelSmall,
        overline: overline,
        bodyXSmall: bodyXSmall,
      );

  static TextStyle _figtreeTextStyle(
    double fontSize,
    FontWeight fontWeight,
  ) =>
      GoogleFonts.figtree(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: Colors.white,
      );

  static AppStyles getAppStyles() => AppStyles.fromTextTheme(
        textTheme: GoogleFonts.figtreeTextTheme().copyWith(
          headlineLarge: _figtreeTextStyle(56.sp, FontWeight.bold),
          headlineMedium: _figtreeTextStyle(48.sp, FontWeight.bold),
          headlineSmall: _figtreeTextStyle(40.sp, FontWeight.bold),
          titleLarge: _figtreeTextStyle(32.sp, FontWeight.bold),
          titleMedium: _figtreeTextStyle(24.sp, FontWeight.bold),
          titleSmall: _figtreeTextStyle(16.sp, FontWeight.bold),
          bodyLarge: _figtreeTextStyle(20.sp, FontWeight.normal),
          bodyMedium: _figtreeTextStyle(16.sp, FontWeight.normal),
          bodySmall: _figtreeTextStyle(14.sp, FontWeight.normal),
        ),
        overline: _figtreeTextStyle(12, FontWeight.normal),
        bodyXSmall: _figtreeTextStyle(12, FontWeight.normal),
      );

  TextTheme getThemeData() => getAppStyles();
}

// ignore: unused-code
extension TextStyleExtensions on TextStyle {
  TextStyle links() => copyWith(
        fontWeight: FontWeight.normal,
        decoration: TextDecoration.underline,
        decorationColor: color,
      );

  TextStyle semibold() => copyWith(fontWeight: _semiboldWeight);

  TextStyle bold() => copyWith(fontWeight: FontWeight.bold);

  TextStyle regular() => copyWith(fontWeight: FontWeight.normal);
}
