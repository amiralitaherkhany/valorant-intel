import 'package:flutter/src/material/app.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:valorant_intel/features/feature_settings/data/datasources/settings_datasource.dart';

class SettingsLocalDatasource implements SettingsDatasource {
  final SharedPreferences _sharedPreferences;

  SettingsLocalDatasource({required SharedPreferences sharedPreferences})
      : _sharedPreferences = sharedPreferences;

  @override
  Future<ThemeMode> getThemeMode() async {
    final themeMode = _sharedPreferences.getString('themeMode');
    return themeMode != null
        ? ThemeMode.values.byName(themeMode)
        : ThemeMode.system;
  }

  @override
  Future<void> setThemeMode(ThemeMode themeMode) async {
    await _sharedPreferences.setString('themeMode', themeMode.name);
  }
}
