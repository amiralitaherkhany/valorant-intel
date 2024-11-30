part of 'settings_bloc.dart';

sealed class SettingsEvent extends Equatable {
  const SettingsEvent();

  @override
  List<Object> get props => [];
}

class InitializeSettingsEvent extends SettingsEvent {}

class SetThemeModeEvent extends SettingsEvent {
  final bool isDarkMode;

  const SetThemeModeEvent({required this.isDarkMode});

  @override
  List<Object> get props => [isDarkMode];
}

class SetLanguageEvent extends SettingsEvent {
  final String languageCode;
  const SetLanguageEvent({required this.languageCode});

  @override
  List<Object> get props => [languageCode];
}
