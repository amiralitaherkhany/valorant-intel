import 'package:flutter/material.dart';

import '../../config/l10n/app_localizations.dart' show AppLocalizations;

extension MediaQueryExtension on BuildContext {
  double get height => MediaQuery.sizeOf(this).height;
  double get width => MediaQuery.sizeOf(this).width;
}

extension LocalizationExtension on BuildContext {
  String translateError(String key) {
    final localizations = AppLocalizations.of(this)!;
    final Map<String, String Function()> translations = {
      'networkFailure': () => localizations.networkFailure,
      'serverError': () => localizations.serverError,
      'unknownError': () => localizations.unknownError,
    };
    return translations[key]?.call() ?? key;
  }

  AppLocalizations get localizations => AppLocalizations.of(this)!;
}

extension SnackBarExtension on BuildContext {
  void showSimpleSnackBar(String message) {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }
}
