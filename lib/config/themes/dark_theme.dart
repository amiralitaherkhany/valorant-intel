import 'package:flutter/material.dart';
import 'package:valorant_intel/config/themes/app_colors.dart';
import 'package:valorant_intel/config/themes/typography.dart';

final AppTypography _darkAppTypography = AppTypography(Brightness.dark);
const darkColorScheme = ColorScheme.dark(
  primary: AppColors.mainRed,
  secondary: AppColors.darkBlue,
  surface: AppColors.cardBackground,
  error: Colors.red,
  onPrimary: AppColors.white,
  onSecondary: AppColors.white,
  onSurface: AppColors.white,
  onError: AppColors.white,
);

final ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  colorScheme: darkColorScheme,
  scaffoldBackgroundColor: AppColors.scaffoldBackground,
  textTheme: _darkAppTypography.textTheme,
  cardTheme: CardTheme(
    color: darkColorScheme.surface,
    shadowColor: darkColorScheme.primary,
    elevation: 4,
  ),
  iconTheme: IconThemeData(color: darkColorScheme.onSurface),
  appBarTheme: AppBarTheme(
    backgroundColor: darkColorScheme.surface,
    titleTextStyle: _darkAppTypography.headline3.copyWith(
      color: darkColorScheme.primary,
    ),
    iconTheme: IconThemeData(color: darkColorScheme.primary),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: darkColorScheme.secondary,
      textStyle: _darkAppTypography.button.copyWith(
        color: darkColorScheme.onSecondary,
      ),
      foregroundColor: darkColorScheme.onSecondary,
    ),
  ),
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: darkColorScheme.surface,
    hintStyle: _darkAppTypography.bodyText2.copyWith(
      color: darkColorScheme.onSurface,
    ),
    border: OutlineInputBorder(
      borderSide: BorderSide(color: darkColorScheme.primary),
      borderRadius: BorderRadius.circular(8),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: darkColorScheme.primary),
      borderRadius: BorderRadius.circular(8),
    ),
  ),
  dialogTheme: DialogTheme(
    backgroundColor: darkColorScheme.surface,
    titleTextStyle: _darkAppTypography.headline2.copyWith(
      color: darkColorScheme.onSurface,
    ),
    contentTextStyle: _darkAppTypography.bodyText1.copyWith(
      color: darkColorScheme.onSurface,
    ),
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: darkColorScheme.surface,
    selectedItemColor: darkColorScheme.primary,
    unselectedItemColor: darkColorScheme.onSurface,
  ),
  snackBarTheme: SnackBarThemeData(
    backgroundColor: darkColorScheme.primary,
    contentTextStyle: _darkAppTypography.bodyText1.copyWith(
      color: darkColorScheme.onPrimary,
    ),
    actionTextColor: AppColors.yellow,
  ),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: darkColorScheme.primary,
    foregroundColor: darkColorScheme.onPrimary,
  ),
  dividerTheme: DividerThemeData(
    color: darkColorScheme.onSurface,
    thickness: 1,
  ),
  switchTheme: SwitchThemeData(
    thumbColor: WidgetStateProperty.all(darkColorScheme.primary),
    trackColor: WidgetStateProperty.all(darkColorScheme.onSurface),
  ),
  indicatorColor: darkColorScheme.primary,
  bottomSheetTheme: BottomSheetThemeData(
    modalBackgroundColor: darkColorScheme.surface,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(15),
        topRight: Radius.circular(15),
      ),
    ),
    dragHandleColor: darkColorScheme.onPrimary,
    showDragHandle: true,
  ),
);
