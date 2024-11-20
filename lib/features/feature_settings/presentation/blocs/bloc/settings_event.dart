part of 'settings_bloc.dart';

sealed class SettingsEvent extends Equatable {
  const SettingsEvent();

  @override
  List<Object> get props => [];
}

class SetThemeEvent extends SettingsEvent {
  final bool isDarkMode;

  const SetThemeEvent({required this.isDarkMode});

  @override
  List<Object> get props => [isDarkMode];
}

class GetThemeEvent extends SettingsEvent {}
