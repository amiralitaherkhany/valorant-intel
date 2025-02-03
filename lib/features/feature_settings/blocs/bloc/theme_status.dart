import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class ThemeStatus extends Equatable {
  ThemeMode get themeMode;
}

final class ThemeInitialState extends ThemeStatus {
  @override
  ThemeMode get themeMode => ThemeMode.system;

  @override
  List<Object?> get props => [themeMode];
}

final class ThemeChangedState extends ThemeStatus {
  @override
  final ThemeMode themeMode;

  ThemeChangedState({required this.themeMode});

  @override
  List<Object?> get props => [themeMode];
}
