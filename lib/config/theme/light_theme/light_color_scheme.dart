import 'package:flutter/material.dart';
import 'package:valorant_intel/config/theme/app_color_scheme.dart';

class LightColorScheme implements AppColorScheme {
  const LightColorScheme();
  @override
  ColorScheme get colorScheme => _lightColorScheme;

  static const _lightColorScheme = ColorScheme.light(
    primary: AppColorScheme.mainRed,
    secondary: AppColorScheme.darkBlue,
    surface: AppColorScheme.grey,
    error: Colors.red,
    onPrimary: Colors.white,
    onSecondary: AppColorScheme.white,
    onSurface: AppColorScheme.cardBackground,
    onError: AppColorScheme.white,
  );
}
