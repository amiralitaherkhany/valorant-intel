import 'package:flutter/material.dart';

@immutable
abstract class LanguageStatus {
  String get languageCode;
}

final class LanguageInitial extends LanguageStatus {
  @override
  String get languageCode => "en";
}

final class LanguageChanged extends LanguageStatus {
  @override
  final String languageCode;
  LanguageChanged({required this.languageCode});
}
