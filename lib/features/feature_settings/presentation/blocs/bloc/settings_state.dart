part of 'settings_bloc.dart';

class SettingsState extends Equatable {
  final ThemeStatus themeStatus;

  const SettingsState({required this.themeStatus});
  @override
  List<Object> get props => [
        themeStatus,
      ];

  SettingsState copyWith({
    ThemeStatus? newThemeStatus,
  }) {
    return SettingsState(
      themeStatus: newThemeStatus ?? themeStatus,
    );
  }
}
