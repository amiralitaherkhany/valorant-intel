import 'package:flutter/material.dart';
import 'package:valorant_intel/core/usecases/use_case.dart';
import 'package:valorant_intel/features/feature_settings/domain/repositories/settings_repository.dart';

class SetThemeModeUsecase implements UseCase<Future<void>, ThemeMode> {
  final SettingsRepository _settingsRepository;

  SetThemeModeUsecase({required SettingsRepository settingsRepository})
      : _settingsRepository = settingsRepository;

  @override
  Future<void> call(ThemeMode themeMode) {
    return _settingsRepository.setThemeMode(themeMode);
  }
}
