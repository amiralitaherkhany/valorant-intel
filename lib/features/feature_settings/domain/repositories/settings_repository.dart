import 'package:flutter/material.dart';

abstract class SettingsRepository {
  Future<void> setThemeMode(ThemeMode themeMode);

  Future<ThemeMode> getThemeMode();
}
