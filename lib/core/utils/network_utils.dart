import 'package:shared_preferences/shared_preferences.dart';

class NetworkUtils {
  final SharedPreferences _sharedPreferences;
  NetworkUtils({required SharedPreferences sharedPreferences})
      : _sharedPreferences = sharedPreferences;
  Future<String> getLanguageCode() async {
    String languageCode = _sharedPreferences.getString('app_language') ?? 'en';

    switch (languageCode) {
      case 'en':
        return 'en-US';

      case 'es':
        return 'es-ES';
      default:
        return 'en-US';
    }
  }
}
