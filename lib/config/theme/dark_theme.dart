import 'package:flutter/material.dart';
import 'package:valorant_intel/config/theme/colors.dart';
import 'package:valorant_intel/config/theme/typography.dart';

final ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  primaryColor: AppColors.mainRed,
  scaffoldBackgroundColor: AppColors.scaffoldBackground,
  textTheme: AppTypography.textTheme,
  cardColor: AppColors.cardBackground,
  iconTheme: const IconThemeData(color: AppColors.white),
  appBarTheme: AppBarTheme(
    backgroundColor: AppColors.cardBackground,
    titleTextStyle: AppTypography.headline3.copyWith(color: AppColors.mainRed),
    iconTheme: const IconThemeData(color: AppColors.mainRed),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: AppColors.darkBlue,
      textStyle: AppTypography.button.copyWith(color: Colors.white),
    ),
  ),
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: AppColors.cardBackground,
    hintStyle: AppTypography.bodyText2.copyWith(color: AppColors.grey),
    border: OutlineInputBorder(
      borderSide: const BorderSide(color: AppColors.mainRed),
      borderRadius: BorderRadius.circular(8),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: AppColors.mainRed),
      borderRadius: BorderRadius.circular(8),
    ),
  ),
  dialogTheme: DialogTheme(
    backgroundColor: AppColors.cardBackground,
    titleTextStyle: AppTypography.headline2.copyWith(color: AppColors.white),
    contentTextStyle: AppTypography.bodyText1.copyWith(color: AppColors.grey),
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: AppColors.scaffoldBackground,
    selectedItemColor: AppColors.mainRed,
    unselectedItemColor: AppColors.grey,
  ),
  snackBarTheme: SnackBarThemeData(
    backgroundColor: AppColors.mainRed,
    contentTextStyle: AppTypography.bodyText1.copyWith(color: Colors.white),
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
);
