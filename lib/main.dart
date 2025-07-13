import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:valorant_intel/app.dart';
import 'package:valorant_intel/features/feature_settings/bloc/settings_bloc.dart';
import 'package:valorant_intel/service_locator.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  final dir = await getApplicationDocumentsDirectory();
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: HydratedStorageDirectory(dir.path),
  );
  await initializeServiceLocator();
  runApp(
    BlocProvider<SettingsBloc>(
      create: (_) => locator(),
      child: const App(),
    ),
  );
}
