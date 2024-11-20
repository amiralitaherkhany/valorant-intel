import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:valorant_intel/features/feature_settings/presentation/blocs/bloc/settings_bloc.dart';
import 'package:valorant_intel/features/feature_settings/presentation/blocs/bloc/theme_status.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<SettingsBloc, SettingsState>(
        builder: (context, state) {
          return ListView(
            children: [
              SwitchListTile(
                value: state.themeStatus is DarkThemeState ? true : false,
                onChanged: (value) => context
                    .read<SettingsBloc>()
                    .add(SetThemeEvent(isDarkMode: value)),
                title: const Text('Dark Mode'),
              )
            ],
          );
        },
      ),
    );
  }
}
