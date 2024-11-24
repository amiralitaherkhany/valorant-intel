import 'package:flutter/material.dart';

@immutable
abstract class ThemeStatus {
  ThemeMode get themeMode;
}

final class ThemeInitial extends ThemeStatus {
  @override
  ThemeMode get themeMode => ThemeMode.system;
}

final class ThemeChanged extends ThemeStatus {
  @override
  final ThemeMode themeMode;

  ThemeChanged({required this.themeMode});
}
