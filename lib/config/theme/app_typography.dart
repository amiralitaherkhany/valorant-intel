import 'package:flutter/material.dart';

abstract class AppTypography {
  // Headline styles
  TextStyle get headline1;

  TextStyle get headline2;

  TextStyle get headline3;

  // Body text styles
  TextStyle get bodyText1;

  TextStyle get bodyText2;

  // Button text styles
  TextStyle get button;

  // Caption or small text
  TextStyle get caption;

  // Apply the custom text theme to an overall TextTheme
  TextTheme get textTheme;
}
