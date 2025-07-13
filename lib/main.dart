import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:valorant_intel/config/router/app_router.dart';
import 'package:valorant_intel/config/theme/dark_theme/dark_theme.dart';
import 'package:valorant_intel/config/theme/light_theme/light_theme.dart';
import 'package:valorant_intel/core/extensions/context_extensions.dart';
import 'package:valorant_intel/features/feature_settings/bloc/settings_bloc.dart';
import 'package:valorant_intel/service_locator.dart';

import 'config/l10n/app_localizations.dart' show AppLocalizations;

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  final dir = await getApplicationDocumentsDirectory();
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: HydratedStorageDirectory(dir.path),
  );
  await initializeServiceLocator();
  runApp(
    BlocProvider<SettingsBloc>(create: (_) => locator(), child: const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
