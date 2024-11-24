part of 'settings_bloc.dart';

sealed class SettingsEvent extends Equatable {
  const SettingsEvent();

  @override
  List<Object> get props => [];
}

class SetThemeModeEvent extends SettingsEvent {
  final bool isDarkMode;

  const SetThemeModeEvent({required this.isDarkMode});

  @override
  List<Object> get props => [isDarkMode];
}

class GetThemeModeEvent extends SettingsEvent {}
