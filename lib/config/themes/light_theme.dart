import 'package:flutter/material.dart';
import 'package:valorant_intel/config/themes/app_colors.dart';
import 'package:valorant_intel/config/themes/typography.dart';

final AppTypography _lightAppTypography = AppTypography(Brightness.light);
const lightColorScheme = ColorScheme.light(
  primary: AppColors.mainRed,
  secondary: AppColors.darkBlue,
  surface: AppColors.grey,
  error: Colors.red,
  onPrimary: Colors.white,
  onSecondary: AppColors.white,
  onSurface: AppColors.cardBackground,
  onError: AppColors.white,
);

final ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  colorScheme: lightColorScheme,
  scaffoldBackgroundColor: lightColorScheme.onPrimary,
  textTheme: _lightAppTypography.textTheme,
  cardTheme: CardTheme(
    color: lightColorScheme.surface,
    shadowColor: lightColorScheme.primary,
    elevation: 4,
  ),
  iconTheme: IconThemeData(color: lightColorScheme.primary),
  appBarTheme: AppBarTheme(
    backgroundColor: lightColorScheme.onPrimary,
    titleTextStyle: _lightAppTypography.headline3.copyWith(
      color: lightColorScheme.primary,
    ),
    iconTheme: IconThemeData(color: lightColorScheme.primary),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: lightColorScheme.secondary,
      textStyle: _lightAppTypography.button.copyWith(
        color: lightColorScheme.onSecondary,
      ),
      foregroundColor: lightColorScheme.onSecondary,
    ),
  ),
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: lightColorScheme.surface,
    hintStyle: _lightAppTypography.bodyText2.copyWith(
      color: lightColorScheme.onSurface,
    ),
    border: OutlineInputBorder(
      borderSide: BorderSide(color: lightColorScheme.primary),
      borderRadius: BorderRadius.circular(8),
    ),
  ),
  dialogTheme: DialogTheme(
    backgroundColor: lightColorScheme.surface,
    titleTextStyle: _lightAppTypography.headline2.copyWith(
      color: lightColorScheme.primary,
    ),
    contentTextStyle: _lightAppTypography.bodyText1.copyWith(
      color: lightColorScheme.onSurface,
    ),
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: lightColorScheme.onPrimary,
    selectedItemColor: lightColorScheme.primary,
    unselectedItemColor: lightColorScheme.onSurface,
  ),
  snackBarTheme: SnackBarThemeData(
    backgroundColor: lightColorScheme.primary,
    contentTextStyle: _lightAppTypography.bodyText1.copyWith(
      color: lightColorScheme.onPrimary,
    ),
    actionTextColor: AppColors.yellow,
  ),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: lightColorScheme.primary,
    foregroundColor: lightColorScheme.onPrimary,
  ),
  dividerTheme: DividerThemeData(
    color: lightColorScheme.onSurface,
    thickness: 1,
  ),
  switchTheme: SwitchThemeData(
    thumbColor: WidgetStateProperty.all(lightColorScheme.primary),
    trackColor: WidgetStateProperty.all(lightColorScheme.onSurface),
  ),
  indicatorColor: lightColorScheme.primary,
  bottomSheetTheme: BottomSheetThemeData(
    modalBackgroundColor: lightColorScheme.surface,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(15),
        topRight: Radius.circular(15),
      ),
    ),
    dragHandleColor: lightColorScheme.onPrimary,
    showDragHandle: true,
  ),
);
