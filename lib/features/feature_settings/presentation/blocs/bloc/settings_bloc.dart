import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:valorant_intel/core/usecases/use_case.dart';
import 'package:valorant_intel/features/feature_settings/domain/usecases/get_language_usecase.dart';
import 'package:valorant_intel/features/feature_settings/domain/usecases/get_theme_mode_usecase.dart';
import 'package:valorant_intel/features/feature_settings/domain/usecases/set_language_usecase.dart';
import 'package:valorant_intel/features/feature_settings/domain/usecases/set_theme_mode_usecase.dart';
import 'package:valorant_intel/features/feature_settings/presentation/blocs/bloc/language_status.dart';
import 'package:valorant_intel/features/feature_settings/presentation/blocs/bloc/theme_status.dart';

part 'settings_event.dart';
part 'settings_state.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  final GetThemeModeUsecase getThemeModeUsecase;
  final SetThemeModeUsecase setThemeModeUsecase;
  final GetLanguageUsecase getLanguageUsecase;
  final SetLanguageUsecase setLanguageUsecase;
  SettingsBloc({
    required this.getThemeModeUsecase,
    required this.setThemeModeUsecase,
    required this.getLanguageUsecase,
    required this.setLanguageUsecase,
  }) : super(
          SettingsState(
            themeStatus: ThemeInitialState(),
            languageStatus: LanguageInitialState(),
          ),
        ) {
    on<InitializeSettingsEvent>((event, emit) async {
      final themeMode = await getThemeModeUsecase(NoParams());
      final languageCode = await getLanguageUsecase(NoParams());
      emit(
        SettingsState(
          themeStatus: ThemeChangedState(themeMode: themeMode),
          languageStatus: LanguageChangedState(languageCode: languageCode),
        ),
      );
    });

    on<SetThemeModeEvent>((event, emit) async {
      await setThemeModeUsecase(
          event.isDarkMode ? ThemeMode.dark : ThemeMode.light);
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
        await setLanguageUsecase(event.languageCode);
        emit(state.copyWith(
            newLanguageStatus:
                LanguageChangedState(languageCode: event.languageCode)));
      },
    );
  }
}
