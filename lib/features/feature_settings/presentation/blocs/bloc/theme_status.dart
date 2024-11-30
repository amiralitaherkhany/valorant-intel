import 'package:flutter/material.dart';

@immutable
abstract class ThemeStatus {
  ThemeMode get themeMode;
}

final class ThemeInitialState extends ThemeStatus {
  @override
  ThemeMode get themeMode => ThemeMode.system;
}

final class ThemeChangedState extends ThemeStatus {
  @override
  final ThemeMode themeMode;

  ThemeChangedState({required this.themeMode});
}
