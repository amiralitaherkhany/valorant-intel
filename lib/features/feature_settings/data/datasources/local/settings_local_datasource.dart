import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:valorant_intel/features/feature_settings/data/datasources/settings_datasource.dart';

class SettingsLocalDatasource implements SettingsDatasource {
  final SharedPreferences _sharedPreferences;

  SettingsLocalDatasource({required SharedPreferences sharedPreferences})
      : _sharedPreferences = sharedPreferences;

  @override
  Future<ThemeMode> getThemeMode() async {
    final themeMode = _sharedPreferences.getString('app_theme');
    return themeMode != null
        ? ThemeMode.values.byName(themeMode)
        : ThemeMode.system;
  }

  @override
  Future<void> setThemeMode(ThemeMode themeMode) async {
    await _sharedPreferences.setString('app_theme', themeMode.name);
  }

  @override
  Future<String> getLanguage() async {
    return _sharedPreferences.getString("app_language") ?? "en";
  }

  @override
  Future<void> setLanguage(String languageCode) async {
    await _sharedPreferences.setString("app_language", languageCode);
  }
}
