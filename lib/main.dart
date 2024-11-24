import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:valorant_intel/config/routes/app_router.dart';
import 'package:valorant_intel/config/themes/app_theme.dart';
import 'package:valorant_intel/features/feature_settings/presentation/blocs/bloc/settings_bloc.dart';
import 'package:valorant_intel/features/feature_settings/presentation/blocs/bloc/theme_status.dart';
import 'package:valorant_intel/service_locator.dart';

void main(List<String> args) async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await initGetIt();
  runApp(
    BlocProvider<SettingsBloc>(
      create: (_) => locator()..add(GetThemeModeEvent()),
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
  bool isThemeApplied = false;
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => isThemeApplied ? FlutterNativeSplash.remove() : null,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsBloc, SettingsState>(
      builder: (context, state) {
        if (state.themeStatus is ThemeChanged) {
          isThemeApplied = true;
        }

        return MaterialApp.router(
          routerConfig: AppRouter.router,
          title: 'Valorant Intel',
          debugShowCheckedModeBanner: false,
          theme: AppTheme.light,
          darkTheme: AppTheme.dark,
          themeMode: state.themeStatus.themeMode,
        );
      },
    );
  }
}
