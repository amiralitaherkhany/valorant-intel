import 'package:flutter/material.dart';
import 'package:valorant_intel/features/feature_settings/data/datasources/settings_datasource.dart';
import 'package:valorant_intel/features/feature_settings/data/repositories/settings_repository.dart';

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

  @override
  Future<String> getLanguage() async {
    return await _settingsDatasource.getLanguage();
  }

  @override
  Future<void> setLanguage(String languageCode) async {
    await _settingsDatasource.setLanguage(languageCode);
  }
}
