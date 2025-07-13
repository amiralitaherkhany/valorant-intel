import 'package:flutter/material.dart';
import 'package:valorant_intel/config/theme/app_color_scheme.dart';
import 'package:valorant_intel/config/theme/app_typography.dart';

class LightTypography implements AppTypography {
  const LightTypography();
  @override
  TextStyle get bodyText1 => TextStyle(
    fontFamily: 'ProximaNova',
    fontSize: 16,
    fontWeight: FontWeight.normal,
    color: AppColorScheme.darkBlue,
  );

  @override
  TextStyle get bodyText2 => TextStyle(
    fontFamily: 'Arial',
    fontSize: 14,
    fontWeight: FontWeight.normal,
    color: AppColorScheme.darkBlue,
  );

  @override
  TextStyle get button => const TextStyle(
    fontFamily: 'DINNext',
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: AppColorScheme.darkBlue,
  );

  @override
  TextStyle get caption => TextStyle(
    fontFamily: 'ProximaNova',
    fontSize: 12,
    fontWeight: FontWeight.normal,
    color: AppColorScheme.grey,
  );

  @override
  TextStyle get headline1 => TextStyle(
    fontFamily: 'Tungsten',
    fontSize: 32,
    fontWeight: FontWeight.bold,
    color: AppColorScheme.darkBlue,
  );

  @override
  TextStyle get headline2 => const TextStyle(
    fontFamily: 'DINNext',
    fontSize: 28,
    fontWeight: FontWeight.bold,
    color: AppColorScheme.mainRed,
  );

  @override
  TextStyle get headline3 => TextStyle(
    fontFamily: 'FFMark',
    fontSize: 24,
    fontWeight: FontWeight.w600,
    color: AppColorScheme.darkBlue,
  );

  @override
  TextTheme get textTheme => TextTheme(
    displayLarge: headline1,
    displayMedium: headline2,
    displaySmall: headline3,
    bodyLarge: bodyText1,
    bodyMedium: bodyText2,
    bodySmall: caption,
    labelLarge: button,
  );
}
