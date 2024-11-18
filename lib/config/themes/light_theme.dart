import 'package:flutter/material.dart';
import 'package:valorant_intel/config/themes/colors.dart';
import 'package:valorant_intel/config/themes/typography.dart';

final AppTypography _lightAppTypography = AppTypography(Brightness.light);
final ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: AppColors.mainRed,
  scaffoldBackgroundColor: Colors.white,
  textTheme: _lightAppTypography.textTheme,
  cardColor: AppColors.cardBackground,
  iconTheme: const IconThemeData(color: AppColors.mainRed),
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.white,
    titleTextStyle:
        _lightAppTypography.headline3.copyWith(color: AppColors.mainRed),
    iconTheme: const IconThemeData(color: AppColors.mainRed),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: AppColors.darkBlue,
      textStyle: _lightAppTypography.button.copyWith(color: Colors.white),
      foregroundColor: Colors.white,
    ),
  ),
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: AppColors.cardBackground,
    hintStyle: _lightAppTypography.bodyText2.copyWith(color: AppColors.grey),
    border: OutlineInputBorder(
      borderSide: const BorderSide(color: AppColors.mainRed),
      borderRadius: BorderRadius.circular(8),
    ),
  ),
  dialogTheme: DialogTheme(
    backgroundColor: Colors.white,
    titleTextStyle:
        _lightAppTypography.headline2.copyWith(color: AppColors.mainRed),
    contentTextStyle:
        _lightAppTypography.bodyText1.copyWith(color: AppColors.grey),
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: Colors.white,
    selectedItemColor: AppColors.mainRed,
    unselectedItemColor: AppColors.grey,
  ),
  snackBarTheme: SnackBarThemeData(
    backgroundColor: AppColors.mainRed,
    contentTextStyle:
        _lightAppTypography.bodyText1.copyWith(color: Colors.white),
    actionTextColor: AppColors.yellow,
  ),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: AppColors.mainRed,
    foregroundColor: Colors.white,
  ),
  dividerTheme: const DividerThemeData(
    color: AppColors.grey,
    thickness: 1,
  ),
  switchTheme: SwitchThemeData(
    thumbColor: WidgetStateProperty.all(AppColors.mainRed),
    trackColor: WidgetStateProperty.all(AppColors.grey),
  ),
  indicatorColor: AppColors.mainRed,
);
