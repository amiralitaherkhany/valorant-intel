import 'package:valorant_intel/features/feature_settings/bloc/settings_bloc.dart';

class NetworkUtils {
  final SettingsBloc _settingsBloc;
  NetworkUtils({required SettingsBloc settingsBloc})
    : _settingsBloc = settingsBloc;

  Future<String> getLanguageCode() async {
    switch (_settingsBloc.state.languageStatus.languageCode) {
      case 'en':
        return 'en-US';

      case 'es':
        return 'es-ES';
      default:
        return 'en-US';
    }
  }
}
