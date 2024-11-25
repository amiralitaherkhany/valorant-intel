import 'package:flutter/material.dart';

abstract class SettingsDatasource {
  Future<void> setThemeMode(ThemeMode themeMode);
  Future<ThemeMode> getThemeMode();
  Future<void> setLanguage(String languageCode);
  Future<String> getLanguage();
}
