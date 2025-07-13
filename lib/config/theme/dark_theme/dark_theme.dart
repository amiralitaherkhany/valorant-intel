import 'package:flutter/material.dart';
import 'package:valorant_intel/config/theme/app_color_scheme.dart';
import 'package:valorant_intel/config/theme/app_theme.dart';
import 'package:valorant_intel/config/theme/app_typography.dart';
import 'package:valorant_intel/config/theme/dark_theme/dark_color_scheme.dart';
import 'package:valorant_intel/config/theme/dark_theme/dark_typography.dart';

class DarkTheme implements AppTheme {
  @override
  DarkColorScheme get colorScheme => _darkColorScheme;

  @override
  ThemeData get theme => _darkTheme;

  @override
  AppTypography get typography => DarkTypography();

  static const _darkTypography = DarkTypography();
  static const _darkColorScheme = DarkColorScheme();
  static final _darkTheme = ThemeData(
    pageTransitionsTheme: PageTransitionsTheme(
      builders: {
        TargetPlatform.android: FadeForwardsPageTransitionsBuilder(),
        TargetPlatform.iOS: FadeForwardsPageTransitionsBuilder(),
        TargetPlatform.macOS: FadeForwardsPageTransitionsBuilder(),
        TargetPlatform.fuchsia: FadeForwardsPageTransitionsBuilder(),
        TargetPlatform.linux: FadeForwardsPageTransitionsBuilder(),
        TargetPlatform.windows: FadeForwardsPageTransitionsBuilder(),
      },
    ),
    brightness: Brightness.dark,
    colorScheme: _darkColorScheme.colorScheme,
    scaffoldBackgroundColor: AppColorScheme.scaffoldBackground,
    textTheme: _darkTypography.textTheme,
    cardTheme: CardThemeData(
      color: _darkColorScheme.colorScheme.surface,
      shadowColor: _darkColorScheme.colorScheme.primary,
      elevation: 4,
    ),
    iconTheme: IconThemeData(color: _darkColorScheme.colorScheme.onSurface),
    appBarTheme: AppBarTheme(
      backgroundColor: _darkColorScheme.colorScheme.surface,
      titleTextStyle: _darkTypography.headline3.copyWith(
        color: _darkColorScheme.colorScheme.primary,
      ),
      iconTheme: IconThemeData(color: _darkColorScheme.colorScheme.primary),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: _darkColorScheme.colorScheme.secondary,
        textStyle: _darkTypography.button.copyWith(
          color: _darkColorScheme.colorScheme.onSecondary,
        ),
        foregroundColor: _darkColorScheme.colorScheme.onSecondary,
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: _darkColorScheme.colorScheme.surface,
      hintStyle: _darkTypography.bodyText2.copyWith(
        color: _darkColorScheme.colorScheme.onSurface,
      ),
      border: OutlineInputBorder(
        borderSide: BorderSide(color: _darkColorScheme.colorScheme.primary),
        borderRadius: BorderRadius.circular(8),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: _darkColorScheme.colorScheme.primary),
        borderRadius: BorderRadius.circular(8),
      ),
    ),
    dialogTheme: DialogThemeData(
      backgroundColor: _darkColorScheme.colorScheme.surface,
      titleTextStyle: _darkTypography.headline2.copyWith(
        color: _darkColorScheme.colorScheme.onSurface,
      ),
      contentTextStyle: _darkTypography.bodyText1.copyWith(
        color: _darkColorScheme.colorScheme.onSurface,
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: _darkColorScheme.colorScheme.surface,
      selectedItemColor: _darkColorScheme.colorScheme.primary,
      unselectedItemColor: _darkColorScheme.colorScheme.onSurface,
    ),
    snackBarTheme: SnackBarThemeData(
      backgroundColor: _darkColorScheme.colorScheme.primary,
      contentTextStyle: _darkTypography.bodyText1.copyWith(
        color: _darkColorScheme.colorScheme.onPrimary,
      ),
      actionTextColor: AppColorScheme.yellow,
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: _darkColorScheme.colorScheme.primary,
      foregroundColor: _darkColorScheme.colorScheme.onPrimary,
    ),
    dividerTheme: DividerThemeData(
      color: _darkColorScheme.colorScheme.onSurface,
      thickness: 1,
    ),
    switchTheme: SwitchThemeData(
      thumbColor: WidgetStateProperty.all(_darkColorScheme.colorScheme.primary),
      trackColor: WidgetStateProperty.all(
        _darkColorScheme.colorScheme.onSurface,
      ),
    ),
    bottomSheetTheme: BottomSheetThemeData(
      modalBackgroundColor: _darkColorScheme.colorScheme.surface,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        ),
      ),
      dragHandleColor: _darkColorScheme.colorScheme.onPrimary,
      showDragHandle: true,
    ),
    tabBarTheme: TabBarThemeData(
      indicatorColor: _darkColorScheme.colorScheme.primary,
    ),
  );
}
