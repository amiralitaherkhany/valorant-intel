import 'package:valorant_intel/core/usecases/use_case.dart';
import 'package:valorant_intel/features/feature_settings/domain/repositories/settings_repository.dart';

class GetLanguageUsecase implements UseCase<Future<String>, NoParams> {
  final SettingsRepository _settingsRepository;

  GetLanguageUsecase({required SettingsRepository settingsRepository})
      : _settingsRepository = settingsRepository;

  @override
  Future<String> call(NoParams params) async {
    return await _settingsRepository.getLanguage();
  }
}
