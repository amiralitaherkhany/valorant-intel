import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:valorant_intel/config/routes/app_router.dart';
import 'package:valorant_intel/config/themes/app_theme.dart';
import 'package:valorant_intel/features/feature_settings/presentation/blocs/bloc/language_status.dart';
import 'package:valorant_intel/features/feature_settings/presentation/blocs/bloc/settings_bloc.dart';
import 'package:valorant_intel/features/feature_settings/presentation/blocs/bloc/theme_status.dart';
import 'package:valorant_intel/service_locator.dart';

void main(List<String> args) async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await initGetIt();
  runApp(
    BlocProvider<SettingsBloc>(
      create: (_) => locator()..add(InitializeSettings()),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isSettingsApplied = false;
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => isSettingsApplied ? FlutterNativeSplash.remove() : null,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsBloc, SettingsState>(
      builder: (context, state) {
        if (state.themeStatus is ThemeChanged &&
            state.languageStatus is LanguageChanged) {
          isSettingsApplied = true;
        }

        return MaterialApp.router(
          locale: Locale(state.languageStatus.languageCode),
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          routerConfig: AppRouter.router,
          onGenerateTitle: (context) => AppLocalizations.of(context)!.appTitle,
          debugShowCheckedModeBanner: false,
          theme: AppTheme.light,
          darkTheme: AppTheme.dark,
          themeMode: state.themeStatus.themeMode,
        );
      },
    );
  }
}
