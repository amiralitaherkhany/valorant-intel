import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:valorant_intel/features/feature_settings/presentation/blocs/bloc/settings_bloc.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<SettingsBloc, SettingsState>(
        builder: (context, state) {
          bool isDarkMode;

          switch (state.themeStatus.themeMode) {
            case ThemeMode.dark:
              isDarkMode = true;
            case ThemeMode.light:
              isDarkMode = false;

            case ThemeMode.system:
              isDarkMode = Theme.of(context).brightness == Brightness.dark
                  ? true
                  : false;
          }
          return ListView(
            children: [
              SwitchListTile(
                value: isDarkMode,
                onChanged: (value) => context
                    .read<SettingsBloc>()
                    .add(SetThemeModeEvent(isDarkMode: value)),
                title: const Text('Dark Mode'),
              )
            ],
          );
        },
      ),
    );
  }
}
