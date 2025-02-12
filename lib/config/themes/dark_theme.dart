import 'package:flutter/material.dart';
import 'package:valorant_intel/config/themes/app_colors.dart';
import 'package:valorant_intel/config/themes/typography.dart';

final AppTypography _darkAppTypography = AppTypography(Brightness.dark);

final ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  primaryColor: AppColors.mainRed,
  scaffoldBackgroundColor: AppColors.scaffoldBackground,
  textTheme: _darkAppTypography.textTheme,
  cardTheme: const CardTheme(
    color: AppColors.cardBackground,
    shadowColor: AppColors.mainRed,
    elevation: 4,
  ),
  iconTheme: const IconThemeData(color: AppColors.white),
  appBarTheme: AppBarTheme(
    backgroundColor: AppColors.cardBackground,
    titleTextStyle:
        _darkAppTypography.headline3.copyWith(color: AppColors.mainRed),
    iconTheme: const IconThemeData(color: AppColors.mainRed),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: AppColors.darkBlue,
      textStyle: _darkAppTypography.button.copyWith(color: Colors.white),
      foregroundColor: Colors.white,
    ),
  ),
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: AppColors.cardBackground,
    hintStyle: _darkAppTypography.bodyText2.copyWith(color: AppColors.grey),
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
    titleTextStyle:
        _darkAppTypography.headline2.copyWith(color: AppColors.white),
    contentTextStyle:
        _darkAppTypography.bodyText1.copyWith(color: AppColors.grey),
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: AppColors.scaffoldBackground,
    selectedItemColor: AppColors.mainRed,
    unselectedItemColor: AppColors.grey,
  ),
  snackBarTheme: SnackBarThemeData(
    backgroundColor: AppColors.mainRed,
    contentTextStyle:
        _darkAppTypography.bodyText1.copyWith(color: Colors.white),
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
  bottomSheetTheme: const BottomSheetThemeData(
    modalBackgroundColor: AppColors.cardBackground,
    shape: BeveledRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(10),
        topRight: Radius.circular(10),
      ),
    ),
    dragHandleColor: Colors.white,
    showDragHandle: true,
  ),
);
