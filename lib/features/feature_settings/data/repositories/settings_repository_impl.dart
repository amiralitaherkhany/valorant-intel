import 'package:flutter/src/material/app.dart';
import 'package:valorant_intel/features/feature_settings/data/datasources/settings_datasource.dart';
import 'package:valorant_intel/features/feature_settings/domain/repositories/settings_repository.dart';

class SettingsRepositoryImpl implements SettingsRepository {
  final SettingsDatasource _settingsDatasource;

  SettingsRepositoryImpl({required SettingsDatasource settingsDatasource})
      : _settingsDatasource = settingsDatasource;
  @override
  Future<ThemeMode> getThemeMode() async {
    return await _settingsDatasource.getThemeMode();
  }

  @override
  Future<void> setThemeMode(ThemeMode themeMode) async {
    return await _settingsDatasource.setThemeMode(themeMode);
  }
}
