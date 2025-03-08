import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:valorant_intel/core/utils/network_utils.dart';
import 'package:valorant_intel/features/feature_settings/bloc/language_status.dart';
import 'package:valorant_intel/features/feature_settings/bloc/settings_bloc.dart';
import 'package:valorant_intel/features/feature_settings/bloc/theme_status.dart';

import 'network_utils_test.mocks.dart';

@GenerateMocks([SettingsBloc])
void main() {
  late NetworkUtils networkUtils;
  late MockSettingsBloc mockSettingsBloc;

  setUp(() {
    mockSettingsBloc = MockSettingsBloc();
    networkUtils = NetworkUtils(settingsBloc: mockSettingsBloc);
  });

  group('getLanguageCode', () {
    test('should return "en-US" if app_language is "en"', () async {
      // Arrange
      when(mockSettingsBloc.state).thenReturn(
        SettingsState(
          languageStatus: LanguageChangedState(languageCode: 'en'),
          themeStatus: ThemeInitialState(),
        ),
      );

      // Act
      final result = await networkUtils.getLanguageCode();

      // Assert
      expect(result, 'en-US');
      verify(mockSettingsBloc.state).called(1);
    });

    test('should return "es-ES" if app_language is "es"', () async {
      // Arrange
      when(mockSettingsBloc.state).thenReturn(
        SettingsState(
          languageStatus: LanguageChangedState(languageCode: 'es'),
          themeStatus: ThemeInitialState(),
        ),
      );

      // Act
      final result = await networkUtils.getLanguageCode();

      // Assert
      expect(result, 'es-ES');
      verify(mockSettingsBloc.state).called(1);
    });

    test('should return "en-US" for an unsupported language code', () async {
      // Arrange
      when(mockSettingsBloc.state).thenReturn(
        SettingsState(
          languageStatus: LanguageChangedState(languageCode: 'fr'),
          themeStatus: ThemeInitialState(),
        ),
      );

      // Act
      final result = await networkUtils.getLanguageCode();

      // Assert
      expect(result, 'en-US');
      verify(mockSettingsBloc.state).called(1);
    });
  });
}
