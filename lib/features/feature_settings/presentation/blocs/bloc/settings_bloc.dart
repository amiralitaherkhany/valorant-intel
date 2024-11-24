import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:valorant_intel/core/usecases/use_case.dart';
import 'package:valorant_intel/features/feature_settings/domain/usecases/get_theme_mode_usecase.dart';
import 'package:valorant_intel/features/feature_settings/domain/usecases/set_theme_mode_usecase.dart';
import 'package:valorant_intel/features/feature_settings/presentation/blocs/bloc/theme_status.dart';

part 'settings_event.dart';
part 'settings_state.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  final GetThemeModeUsecase getThemeModeUsecase;
  final SetThemeModeUsecase setThemeModeUsecase;
  SettingsBloc({
    required this.getThemeModeUsecase,
    required this.setThemeModeUsecase,
  }) : super(
          SettingsState(
            themeStatus: ThemeInitial(),
          ),
        ) {
    on<GetThemeModeEvent>((event, emit) async {
      final themeMode = await getThemeModeUsecase(NoParams());
      emit(state.copyWith(newThemeStatus: ThemeChanged(themeMode: themeMode)));
    });

    on<SetThemeModeEvent>((event, emit) async {
      await setThemeModeUsecase(
          event.isDarkMode ? ThemeMode.dark : ThemeMode.light);
      if (event.isDarkMode) {
        emit(state.copyWith(
            newThemeStatus: ThemeChanged(themeMode: ThemeMode.dark)));
      } else {
        emit(state.copyWith(
            newThemeStatus: ThemeChanged(themeMode: ThemeMode.light)));
      }
    });
  }
}
