import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:valorant_intel/core/utils/network_utils.dart';

import 'network_utils_test.mocks.dart';

@GenerateMocks([SharedPreferences])
void main() {
  late NetworkUtils networkUtils;
  late MockSharedPreferences mockSharedPreferences;

  setUp(() {
    mockSharedPreferences = MockSharedPreferences();
    networkUtils = NetworkUtils(sharedPreferences: mockSharedPreferences);
  });
  group('getLanguageCode', () {
    test('should return "en-US" if app_language is "en"', () async {
      // Arrange
      when(mockSharedPreferences.getString('app_language')).thenReturn('en');

      // Act
      final result = await networkUtils.getLanguageCode();

      // Assert
      expect(result, 'en-US');
      verify(mockSharedPreferences.getString('app_language')).called(1);
    });

    test('should return "es-ES" if app_language is "es"', () async {
      // Arrange
      when(mockSharedPreferences.getString('app_language')).thenReturn('es');

      // Act
      final result = await networkUtils.getLanguageCode();

      // Assert
      expect(result, 'es-ES');
      verify(mockSharedPreferences.getString('app_language')).called(1);
    });

    test('should return "en-US" if app_language is not set', () async {
      // Arrange
      when(mockSharedPreferences.getString('app_language')).thenReturn(null);

      // Act
      final result = await networkUtils.getLanguageCode();

      // Assert
      expect(result, 'en-US');
      verify(mockSharedPreferences.getString('app_language')).called(1);
    });

    test('should return "en-US" for an unsupported language code', () async {
      // Arrange
      when(mockSharedPreferences.getString('app_language')).thenReturn('fr');

      // Act
      final result = await networkUtils.getLanguageCode();

      // Assert
      expect(result, 'en-US');
      verify(mockSharedPreferences.getString('app_language')).called(1);
    });
  });
}
