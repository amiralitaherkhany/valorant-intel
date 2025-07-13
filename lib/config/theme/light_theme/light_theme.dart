import 'package:flutter/material.dart';
import 'package:valorant_intel/config/theme/app_color_scheme.dart';
import 'package:valorant_intel/config/theme/app_theme.dart';
import 'package:valorant_intel/config/theme/app_typography.dart';
import 'package:valorant_intel/config/theme/light_theme/light_color_scheme.dart';
import 'package:valorant_intel/config/theme/light_theme/light_typography.dart';

class LightTheme implements AppTheme {
  @override
  AppColorScheme get colorScheme => _lightColorScheme;

  @override
  ThemeData get theme => _lightTheme;

  @override
  AppTypography get typography => _lightTypography;

  static const _lightTypography = LightTypography();
  static const _lightColorScheme = LightColorScheme();
  static final _lightTheme = ThemeData(
    pageTransitionsTheme: const PageTransitionsTheme(
      builders: {
        TargetPlatform.android: FadeForwardsPageTransitionsBuilder(),
        TargetPlatform.iOS: FadeForwardsPageTransitionsBuilder(),
        TargetPlatform.macOS: FadeForwardsPageTransitionsBuilder(),
        TargetPlatform.fuchsia: FadeForwardsPageTransitionsBuilder(),
        TargetPlatform.linux: FadeForwardsPageTransitionsBuilder(),
        TargetPlatform.windows: FadeForwardsPageTransitionsBuilder(),
      },
    ),
    brightness: Brightness.light,
    colorScheme: _lightColorScheme.colorScheme,
    scaffoldBackgroundColor: _lightColorScheme.colorScheme.onPrimary,
    textTheme: _lightTypography.textTheme,
    cardTheme: CardThemeData(
      color: _lightColorScheme.colorScheme.surface,
      shadowColor: _lightColorScheme.colorScheme.primary,
      elevation: 4,
    ),
    iconTheme: IconThemeData(color: _lightColorScheme.colorScheme.primary),
    appBarTheme: AppBarTheme(
      backgroundColor: _lightColorScheme.colorScheme.onPrimary,
      titleTextStyle: _lightTypography.headline3.copyWith(
        color: _lightColorScheme.colorScheme.primary,
      ),
      iconTheme: IconThemeData(color: _lightColorScheme.colorScheme.primary),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: _lightColorScheme.colorScheme.secondary,
        textStyle: _lightTypography.button.copyWith(
          color: _lightColorScheme.colorScheme.onSecondary,
        ),
        foregroundColor: _lightColorScheme.colorScheme.onSecondary,
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: _lightColorScheme.colorScheme.surface,
      hintStyle: _lightTypography.bodyText2.copyWith(
        color: _lightColorScheme.colorScheme.onSurface,
      ),
      border: OutlineInputBorder(
        borderSide: BorderSide(color: _lightColorScheme.colorScheme.primary),
        borderRadius: BorderRadius.circular(8),
      ),
    ),
    dialogTheme: DialogThemeData(
      backgroundColor: _lightColorScheme.colorScheme.surface,
      titleTextStyle: _lightTypography.headline2.copyWith(
        color: _lightColorScheme.colorScheme.primary,
      ),
      contentTextStyle: _lightTypography.bodyText1.copyWith(
        color: _lightColorScheme.colorScheme.onSurface,
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: _lightColorScheme.colorScheme.onPrimary,
      selectedItemColor: _lightColorScheme.colorScheme.primary,
      unselectedItemColor: _lightColorScheme.colorScheme.onSurface,
    ),
    snackBarTheme: SnackBarThemeData(
      backgroundColor: _lightColorScheme.colorScheme.primary,
      contentTextStyle: _lightTypography.bodyText1.copyWith(
        color: _lightColorScheme.colorScheme.onPrimary,
      ),
      actionTextColor: AppColorScheme.yellow,
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: _lightColorScheme.colorScheme.primary,
      foregroundColor: _lightColorScheme.colorScheme.onPrimary,
    ),
    dividerTheme: DividerThemeData(
      color: _lightColorScheme.colorScheme.onSurface,
      thickness: 1,
    ),
    switchTheme: SwitchThemeData(
      thumbColor: WidgetStateProperty.all(
        _lightColorScheme.colorScheme.primary,
      ),
      trackColor: WidgetStateProperty.all(
        _lightColorScheme.colorScheme.onSurface,
      ),
    ),
    bottomSheetTheme: BottomSheetThemeData(
      modalBackgroundColor: _lightColorScheme.colorScheme.surface,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        ),
      ),
      dragHandleColor: _lightColorScheme.colorScheme.onPrimary,
      showDragHandle: true,
    ),
    tabBarTheme: TabBarThemeData(
      indicatorColor: _lightColorScheme.colorScheme.primary,
    ),
  );
}
