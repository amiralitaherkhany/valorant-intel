import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:valorant_intel/config/routes/app_router.dart';
import 'package:valorant_intel/config/themes/app_theme.dart';
import 'package:valorant_intel/features/feature_settings/presentation/blocs/bloc/settings_bloc.dart';
import 'package:valorant_intel/features/feature_settings/presentation/blocs/bloc/theme_status.dart';
import 'package:valorant_intel/service_locator.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await initGetIt();
  runApp(
    BlocProvider<SettingsBloc>(
      create: (_) => locator()..add(GetThemeEvent()),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsBloc, SettingsState>(
      builder: (context, state) {
        ThemeMode themeMode;
        if (state.themeStatus is DarkThemeState) {
          themeMode = ThemeMode.dark;
        } else {
          themeMode = ThemeMode.light;
        }
        return MaterialApp.router(
          routerConfig: AppRouter.router,
          title: 'Valorant Intel',
          debugShowCheckedModeBanner: false,
          theme: AppTheme.light,
          darkTheme: AppTheme.dark,
          themeMode: themeMode,
        );
      },
    );
  }
}
