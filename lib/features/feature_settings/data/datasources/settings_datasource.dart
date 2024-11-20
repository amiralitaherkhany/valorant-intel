import 'package:flutter/material.dart';

abstract class SettingsDatasource {
  Future<void> setThemeMode(ThemeMode themeMode);
  Future<ThemeMode> getThemeMode();
}
