import 'package:flutter/material.dart';

@immutable
abstract class ThemeStatus {}

final class ThemeInitial extends ThemeStatus {}

final class LightThemeState extends ThemeStatus {}

final class DarkThemeState extends ThemeStatus {}
