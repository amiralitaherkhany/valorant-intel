import 'package:flutter/material.dart';
import 'package:valorant_intel/core/usecases/use_case.dart';
import 'package:valorant_intel/features/feature_settings/domain/repositories/settings_repository.dart';

class GetThemeModeUsecase implements UseCase<Future<ThemeMode>, NoParams> {
  final SettingsRepository _settingsRepository;

  GetThemeModeUsecase({required SettingsRepository settingsRepository})
      : _settingsRepository = settingsRepository;

  @override
  Future<ThemeMode> call(NoParams params) {
    return _settingsRepository.getThemeMode();
  }
}
