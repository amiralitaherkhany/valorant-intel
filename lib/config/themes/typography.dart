import 'package:flutter/material.dart';
import 'package:valorant_intel/config/themes/colors.dart';

class AppTypography {
  // Headline styles
  static const TextStyle headline1 = TextStyle(
    fontFamily: 'Tungsten',
    fontSize: 32,
    fontWeight: FontWeight.bold,
    color: AppColors.white, // استفاده از رنگ سفید برای عنوان‌های بزرگ
  );

  static const TextStyle headline2 = TextStyle(
    fontFamily: 'DINNext',
    fontSize: 28,
    fontWeight: FontWeight.bold,
    color: AppColors.mainRed, // استفاده از رنگ قرمز اصلی برای عنوان‌های دوم
  );

  static const TextStyle headline3 = TextStyle(
    fontFamily: 'FFMark',
    fontSize: 24,
    fontWeight: FontWeight.w600,
    color: AppColors.white, // استفاده از رنگ سفید برای عنوان‌های سوم
  );

  // Body text styles
  static const TextStyle bodyText1 = TextStyle(
    fontFamily: 'ProximaNova',
    fontSize: 16,
    fontWeight: FontWeight.normal,
    color: AppColors.grey, // استفاده از رنگ خاکستری برای متن‌های اصلی
  );

  static const TextStyle bodyText2 = TextStyle(
    fontFamily: 'Arial',
    fontSize: 14,
    fontWeight: FontWeight.normal,
    color: AppColors.white, // استفاده از رنگ سفید برای متن‌های فرعی
  );

  // Button text styles
  static const TextStyle button = TextStyle(
    fontFamily: 'DINNext',
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: AppColors.darkBlue, // استفاده از رنگ آبی تیره برای متن دکمه‌ها
  );

  // Caption or small text
  static const TextStyle caption = TextStyle(
    fontFamily: 'ProximaNova',
    fontSize: 12,
    fontWeight: FontWeight.normal,
    color: AppColors.grey, // استفاده از رنگ خاکستری برای متن‌های توضیحی کوچک
  );

  // Apply the custom text theme to an overall TextTheme
  static TextTheme get textTheme => const TextTheme(
        displayLarge: headline1,
        displayMedium: headline2,
        displaySmall: headline3,
        bodyLarge: bodyText1,
        bodyMedium: bodyText2,
        labelLarge: button,
        bodySmall: caption,
      );
}
