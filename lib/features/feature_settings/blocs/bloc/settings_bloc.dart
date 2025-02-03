import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:valorant_intel/features/feature_settings/blocs/bloc/language_status.dart';
import 'package:valorant_intel/features/feature_settings/blocs/bloc/theme_status.dart';
import 'package:valorant_intel/features/feature_settings/data/repositories/settings_repository.dart';

part 'settings_event.dart';
part 'settings_state.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  final SettingsRepository _settingsRepository;
  SettingsBloc({required SettingsRepository settingsRepository})
      : _settingsRepository = settingsRepository,
        super(
          SettingsState(
            themeStatus: ThemeInitialState(),
            languageStatus: LanguageInitialState(),
          ),
        ) {
    on<InitializeSettingsEvent>((event, emit) async {
      final themeMode = await _settingsRepository.getThemeMode();
      final languageCode = await _settingsRepository.getLanguage();
      emit(
        SettingsState(
          themeStatus: ThemeChangedState(themeMode: themeMode),
          languageStatus: LanguageChangedState(languageCode: languageCode),
        ),
      );
    });

    on<SetThemeModeEvent>((event, emit) async {
      await _settingsRepository
          .setThemeMode(event.isDarkMode ? ThemeMode.dark : ThemeMode.light);
      if (event.isDarkMode) {
        emit(state.copyWith(
            newThemeStatus: ThemeChangedState(themeMode: ThemeMode.dark)));
      } else {
        emit(state.copyWith(
            newThemeStatus: ThemeChangedState(themeMode: ThemeMode.light)));
      }
    });

    on<SetLanguageEvent>(
      (event, emit) async {
        await _settingsRepository.setLanguage(event.languageCode);
        emit(state.copyWith(
            newLanguageStatus:
                LanguageChangedState(languageCode: event.languageCode)));
      },
    );
  }
}
