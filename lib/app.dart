import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:valorant_intel/config/l10n/app_localizations.dart';
import 'package:valorant_intel/config/router/app_router.dart';
import 'package:valorant_intel/config/theme/dark_theme/dark_theme.dart';
import 'package:valorant_intel/config/theme/light_theme/light_theme.dart';
import 'package:valorant_intel/core/extensions/context_extensions.dart';
import 'package:valorant_intel/features/feature_settings/bloc/settings_bloc.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsBloc, SettingsState>(
      builder: (context, state) {
        return MaterialApp.router(
          locale: Locale(state.languageStatus.languageCode),
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          routerConfig: AppRouter.router,
          onGenerateTitle: (context) => context.localizations.appTitle,
          debugShowCheckedModeBanner: false,
          theme: DarkTheme().theme,
          darkTheme: LightTheme().theme,
          themeMode: state.themeStatus.themeMode,
        );
      },
    );
  }
}
