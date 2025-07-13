import 'package:flutter/material.dart';
import 'package:valorant_intel/config/theme/app_color_scheme.dart'
    show AppColorScheme;
import 'package:valorant_intel/config/theme/app_typography.dart'
    show AppTypography;

abstract class AppTheme {
  ThemeData get theme;
  AppTypography get typography;
  AppColorScheme get colorScheme;
}
