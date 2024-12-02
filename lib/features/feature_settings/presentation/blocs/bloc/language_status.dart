import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class LanguageStatus extends Equatable {
  String get languageCode;
}

final class LanguageInitialState extends LanguageStatus {
  @override
  String get languageCode => "en";

  @override
  List<Object?> get props => [languageCode];
}

final class LanguageChangedState extends LanguageStatus {
  @override
  final String languageCode;
  LanguageChangedState({required this.languageCode});

  @override
  List<Object?> get props => [languageCode];
}
