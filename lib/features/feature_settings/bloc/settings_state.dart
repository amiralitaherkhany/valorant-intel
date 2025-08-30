part of 'settings_bloc.dart';

class SettingsState extends Equatable {
  final ThemeStatus themeStatus;
  final LanguageStatus languageStatus;
  const SettingsState({
    required this.themeStatus,
    required this.languageStatus,
  });
  @override
  List<Object> get props => [
    themeStatus,
    languageStatus,
  ];

  SettingsState copyWith({
    ThemeStatus? newThemeStatus,
    LanguageStatus? newLanguageStatus,
  }) {
    return SettingsState(
      themeStatus: newThemeStatus ?? themeStatus,
      languageStatus: newLanguageStatus ?? languageStatus,
    );
  }
}
