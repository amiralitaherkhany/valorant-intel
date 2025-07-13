import 'package:flutter/material.dart';
import 'package:valorant_intel/config/theme/app_color_scheme.dart';

class DarkColorScheme implements AppColorScheme {
  const DarkColorScheme();
  @override
  ColorScheme get colorScheme => _darkColorScheme;
  static const _darkColorScheme = ColorScheme.dark(
    primary: AppColorScheme.mainRed,
    secondary: AppColorScheme.darkBlue,
    surface: AppColorScheme.cardBackground,
    error: Colors.red,
    onPrimary: AppColorScheme.white,
    onSecondary: AppColorScheme.white,
    onSurface: AppColorScheme.white,
    onError: AppColorScheme.white,
  );
}
