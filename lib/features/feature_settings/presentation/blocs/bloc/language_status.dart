import 'package:flutter/material.dart';

@immutable
abstract class LanguageStatus {
  String get languageCode;
}

final class LanguageInitialState extends LanguageStatus {
  @override
  String get languageCode => "en";
}

final class LanguageChangedState extends LanguageStatus {
  @override
  final String languageCode;
  LanguageChangedState({required this.languageCode});
}
