import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:valorant_intel/features/feature_settings/bloc/language_status.dart';
import 'package:valorant_intel/features/feature_settings/bloc/theme_status.dart';

part 'settings_event.dart';
part 'settings_state.dart';

class SettingsBloc extends HydratedBloc<SettingsEvent, SettingsState> {
  SettingsBloc()
    : super(
        SettingsState(
          themeStatus: ThemeInitialState(),
          languageStatus: LanguageInitialState(),
        ),
      ) {
    on<SetThemeModeEvent>((event, emit) async {
      emit(
        state.copyWith(
          newThemeStatus: ThemeChangedState(
            themeMode: event.isDarkMode ? ThemeMode.dark : ThemeMode.light,
          ),
        ),
      );
    });

    on<SetLanguageEvent>((event, emit) async {
      emit(
        state.copyWith(
          newLanguageStatus: LanguageChangedState(
            languageCode: event.languageCode,
          ),
        ),
      );
    });
  }

  @override
  SettingsState? fromJson(Map<String, dynamic> json) {
    return SettingsState(
      themeStatus: ThemeChangedState(
        themeMode: ThemeMode.values[json['themeMode'] as int],
      ),
      languageStatus: LanguageChangedState(
        languageCode: json['languageCode'],
      ),
    );
  }

  @override
  Map<String, dynamic>? toJson(SettingsState state) {
    return {
      "themeMode": state.themeStatus.themeMode.index,
      "languageCode": state.languageStatus.languageCode,
    };
  }
}
