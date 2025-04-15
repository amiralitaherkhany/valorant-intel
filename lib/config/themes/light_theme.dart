import 'package:flutter/material.dart';
import 'package:valorant_intel/config/themes/app_colors.dart';
import 'package:valorant_intel/config/themes/typography.dart';

final AppTypography _lightAppTypography = AppTypography(Brightness.light);

final ThemeData lightTheme = ThemeData(
  pageTransitionsTheme: const PageTransitionsTheme(builders: {
    TargetPlatform.android: FadeForwardsPageTransitionsBuilder(),
    TargetPlatform.iOS: FadeForwardsPageTransitionsBuilder(),
    TargetPlatform.macOS: FadeForwardsPageTransitionsBuilder(),
    TargetPlatform.fuchsia: FadeForwardsPageTransitionsBuilder(),
    TargetPlatform.linux: FadeForwardsPageTransitionsBuilder(),
    TargetPlatform.windows: FadeForwardsPageTransitionsBuilder(),
  }),
  brightness: Brightness.light,
  colorScheme: AppColors.lightColorScheme,
  scaffoldBackgroundColor: AppColors.lightColorScheme.onPrimary,
  textTheme: _lightAppTypography.textTheme,
  cardTheme: CardTheme(
    color: AppColors.lightColorScheme.surface,
    shadowColor: AppColors.lightColorScheme.primary,
    elevation: 4,
  ),
  iconTheme: IconThemeData(color: AppColors.lightColorScheme.primary),
  appBarTheme: AppBarTheme(
    backgroundColor: AppColors.lightColorScheme.onPrimary,
    titleTextStyle: _lightAppTypography.headline3.copyWith(
      color: AppColors.lightColorScheme.primary,
    ),
    iconTheme: IconThemeData(color: AppColors.lightColorScheme.primary),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: AppColors.lightColorScheme.secondary,
      textStyle: _lightAppTypography.button.copyWith(
        color: AppColors.lightColorScheme.onSecondary,
      ),
      foregroundColor: AppColors.lightColorScheme.onSecondary,
    ),
  ),
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: AppColors.lightColorScheme.surface,
    hintStyle: _lightAppTypography.bodyText2.copyWith(
      color: AppColors.lightColorScheme.onSurface,
    ),
    border: OutlineInputBorder(
      borderSide: BorderSide(color: AppColors.lightColorScheme.primary),
      borderRadius: BorderRadius.circular(8),
    ),
  ),
  dialogTheme: DialogTheme(
    backgroundColor: AppColors.lightColorScheme.surface,
    titleTextStyle: _lightAppTypography.headline2.copyWith(
      color: AppColors.lightColorScheme.primary,
    ),
    contentTextStyle: _lightAppTypography.bodyText1.copyWith(
      color: AppColors.lightColorScheme.onSurface,
    ),
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: AppColors.lightColorScheme.onPrimary,
    selectedItemColor: AppColors.lightColorScheme.primary,
    unselectedItemColor: AppColors.lightColorScheme.onSurface,
  ),
  snackBarTheme: SnackBarThemeData(
    backgroundColor: AppColors.lightColorScheme.primary,
    contentTextStyle: _lightAppTypography.bodyText1.copyWith(
      color: AppColors.lightColorScheme.onPrimary,
    ),
    actionTextColor: AppColors.yellow,
  ),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: AppColors.lightColorScheme.primary,
    foregroundColor: AppColors.lightColorScheme.onPrimary,
  ),
  dividerTheme: DividerThemeData(
    color: AppColors.lightColorScheme.onSurface,
    thickness: 1,
  ),
  switchTheme: SwitchThemeData(
    thumbColor: WidgetStateProperty.all(AppColors.lightColorScheme.primary),
    trackColor: WidgetStateProperty.all(AppColors.lightColorScheme.onSurface),
  ),
  indicatorColor: AppColors.lightColorScheme.primary,
  bottomSheetTheme: BottomSheetThemeData(
    modalBackgroundColor: AppColors.lightColorScheme.surface,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(15),
        topRight: Radius.circular(15),
      ),
    ),
    dragHandleColor: AppColors.lightColorScheme.onPrimary,
    showDragHandle: true,
  ),
);
