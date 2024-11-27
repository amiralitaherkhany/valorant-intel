import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:valorant_intel/features/feature_settings/presentation/blocs/bloc/settings_bloc.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
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
              ThemeSwitcherListTile(isDarkMode: isDarkMode),
              ListTile(
                title: Text(AppLocalizations.of(context)!.language),
                trailing: DropdownButton<String>(
                  value: state.languageStatus.languageCode,
                  items: const [
                    DropdownMenuItem(
                      value: "en",
                      child: Text(
                        "English",
                      ),
                    ),
                    DropdownMenuItem(
                      value: "es",
                      child: Text(
                        "español",
                      ),
                    ),
                  ],
                  onChanged: (String? newValue) {
                    if (newValue != null) {
                      context
                          .read<SettingsBloc>()
                          .add(SetLanguageEvent(languageCode: newValue));
                    }
                  },
                ),
              )
            ],
          );
        },
      ),
    );
  }
}

class ThemeSwitcherListTile extends StatelessWidget {
  const ThemeSwitcherListTile({
    super.key,
    required this.isDarkMode,
  });

  final bool isDarkMode;

  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      value: isDarkMode,
      onChanged: (value) => context
          .read<SettingsBloc>()
          .add(SetThemeModeEvent(isDarkMode: value)),
      title: Text(
        AppLocalizations.of(context)!.darkMode,
      ),
    );
  }
}
