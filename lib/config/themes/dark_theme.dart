import 'package:flutter/material.dart';
import 'package:valorant_intel/config/themes/app_colors.dart';
import 'package:valorant_intel/config/themes/typography.dart';

final AppTypography _darkAppTypography = AppTypography(Brightness.dark);

final ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  colorScheme: AppColors.darkColorScheme,
  scaffoldBackgroundColor: AppColors.scaffoldBackground,
  textTheme: _darkAppTypography.textTheme,
  cardTheme: CardTheme(
    color: AppColors.darkColorScheme.surface,
    shadowColor: AppColors.darkColorScheme.primary,
    elevation: 4,
  ),
  iconTheme: IconThemeData(color: AppColors.darkColorScheme.onSurface),
  appBarTheme: AppBarTheme(
    backgroundColor: AppColors.darkColorScheme.surface,
    titleTextStyle: _darkAppTypography.headline3.copyWith(
      color: AppColors.darkColorScheme.primary,
    ),
    iconTheme: IconThemeData(color: AppColors.darkColorScheme.primary),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: AppColors.darkColorScheme.secondary,
      textStyle: _darkAppTypography.button.copyWith(
        color: AppColors.darkColorScheme.onSecondary,
      ),
      foregroundColor: AppColors.darkColorScheme.onSecondary,
    ),
  ),
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: AppColors.darkColorScheme.surface,
    hintStyle: _darkAppTypography.bodyText2.copyWith(
      color: AppColors.darkColorScheme.onSurface,
    ),
    border: OutlineInputBorder(
      borderSide: BorderSide(color: AppColors.darkColorScheme.primary),
      borderRadius: BorderRadius.circular(8),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: AppColors.darkColorScheme.primary),
      borderRadius: BorderRadius.circular(8),
    ),
  ),
  dialogTheme: DialogTheme(
    backgroundColor: AppColors.darkColorScheme.surface,
    titleTextStyle: _darkAppTypography.headline2.copyWith(
      color: AppColors.darkColorScheme.onSurface,
    ),
    contentTextStyle: _darkAppTypography.bodyText1.copyWith(
      color: AppColors.darkColorScheme.onSurface,
    ),
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: AppColors.darkColorScheme.surface,
    selectedItemColor: AppColors.darkColorScheme.primary,
    unselectedItemColor: AppColors.darkColorScheme.onSurface,
  ),
  snackBarTheme: SnackBarThemeData(
    backgroundColor: AppColors.darkColorScheme.primary,
    contentTextStyle: _darkAppTypography.bodyText1.copyWith(
      color: AppColors.darkColorScheme.onPrimary,
    ),
    actionTextColor: AppColors.yellow,
  ),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: AppColors.darkColorScheme.primary,
    foregroundColor: AppColors.darkColorScheme.onPrimary,
  ),
  dividerTheme: DividerThemeData(
    color: AppColors.darkColorScheme.onSurface,
    thickness: 1,
  ),
  switchTheme: SwitchThemeData(
    thumbColor: WidgetStateProperty.all(AppColors.darkColorScheme.primary),
    trackColor: WidgetStateProperty.all(AppColors.darkColorScheme.onSurface),
  ),
  indicatorColor: AppColors.darkColorScheme.primary,
  bottomSheetTheme: BottomSheetThemeData(
    modalBackgroundColor: AppColors.darkColorScheme.surface,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(15),
        topRight: Radius.circular(15),
      ),
    ),
    dragHandleColor: AppColors.darkColorScheme.onPrimary,
    showDragHandle: true,
  ),
);
