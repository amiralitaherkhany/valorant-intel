import 'package:valorant_intel/core/usecases/use_case.dart';
import 'package:valorant_intel/features/feature_settings/domain/repositories/settings_repository.dart';

class SetLanguageUsecase implements UseCase<Future<void>, String> {
  final SettingsRepository _settingsRepository;

  SetLanguageUsecase({required SettingsRepository settingsRepository})
      : _settingsRepository = settingsRepository;

  @override
  Future<void> call(String params) async {
    await _settingsRepository.setLanguage(params);
  }
}
