import 'package:flutter/material.dart';
import 'package:valorant_intel/config/themes/app_colors.dart';

class AppTypography {
  final Brightness brightness;

  AppTypography(this.brightness);

  // Headline styles
  TextStyle get headline1 => TextStyle(
        fontFamily: 'Tungsten',
        fontSize: 32,
        fontWeight: FontWeight.bold,
        color: brightness == Brightness.dark
            ? AppColors.white
            : AppColors.darkBlue,
      );

  TextStyle get headline2 => const TextStyle(
        fontFamily: 'DINNext',
        fontSize: 28,
        fontWeight: FontWeight.bold,
        color: AppColors.mainRed, // رنگ ثابت برای عنوان‌های دوم
      );

  TextStyle get headline3 => TextStyle(
        fontFamily: 'FFMark',
        fontSize: 24,
        fontWeight: FontWeight.w600,
        color: brightness == Brightness.dark
            ? AppColors.white
            : AppColors.darkBlue,
      );

  // Body text styles
  TextStyle get bodyText1 => TextStyle(
        fontFamily: 'ProximaNova',
        fontSize: 16,
        fontWeight: FontWeight.normal,
        color: brightness == Brightness.dark
            ? AppColors.white
            : AppColors.darkBlue,
      );

  TextStyle get bodyText2 => TextStyle(
        fontFamily: 'Arial',
        fontSize: 14,
        fontWeight: FontWeight.normal,
        color: brightness == Brightness.dark
            ? AppColors.white
            : AppColors.darkBlue,
      );

  // Button text styles
  TextStyle get button => const TextStyle(
        fontFamily: 'DINNext',
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: AppColors.darkBlue, // رنگ ثابت برای دکمه‌ها
      );

  // Caption or small text
  TextStyle get caption => TextStyle(
        fontFamily: 'ProximaNova',
        fontSize: 12,
        fontWeight: FontWeight.normal,
        color: brightness == Brightness.dark ? AppColors.white : AppColors.grey,
      );

  // Apply the custom text theme to an overall TextTheme based on current brightness
  TextTheme get textTheme => TextTheme(
        displayLarge: headline1,
        displayMedium: headline2,
        displaySmall: headline3,
        bodyLarge: bodyText1,
        bodyMedium: bodyText2,
        labelLarge: button,
        bodySmall: caption,
      );
}
