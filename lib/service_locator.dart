import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:valorant_intel/core/constants/api_constants.dart';
import 'package:valorant_intel/core/utils/network_utils.dart';
import 'package:valorant_intel/features/feature_agent/blocs/agent_bloc.dart';
import 'package:valorant_intel/features/feature_agent/data/datasources/agent_datasource.dart';
import 'package:valorant_intel/features/feature_agent/data/datasources/remote/agent_remote_datasource.dart';
import 'package:valorant_intel/features/feature_agent/data/repositories/agent_repository.dart';
import 'package:valorant_intel/features/feature_agent/data/repositories/agent_repository_impl.dart';
import 'package:valorant_intel/features/feature_settings/blocs/bloc/settings_bloc.dart';
import 'package:valorant_intel/features/feature_settings/data/datasources/local/settings_local_datasource.dart';
import 'package:valorant_intel/features/feature_settings/data/datasources/settings_datasource.dart';
import 'package:valorant_intel/features/feature_settings/data/repositories/settings_repository.dart';
import 'package:valorant_intel/features/feature_settings/data/repositories/settings_repository_impl.dart';

final GetIt locator = GetIt.instance;

Future<void> initializeServiceLocator() async {
  // Register components as a singleton
  locator.registerLazySingleton<Dio>(
    () => Dio(BaseOptions(baseUrl: ApiConstants.baseUrl)),
  );
  locator.registerSingleton<SharedPreferences>(
    await SharedPreferences.getInstance(),
  );
  locator.registerSingleton<NetworkUtils>(
      NetworkUtils(sharedPreferences: locator()));
  //register dataSources
  locator.registerFactory<AgentDatasource>(
    () => AgentRemoteDatasource(
      dio: locator(),
      networkUtils: locator(),
    ),
  );
  locator.registerFactory<SettingsDatasource>(
    () => SettingsLocalDatasource(
      sharedPreferences: locator(),
    ),
  );
  //register repositories
  locator.registerFactory<AgentRepository>(
    () => AgentRepositoryImpl(
      agentDatasource: locator(),
    ),
  );
  locator.registerFactory<SettingsRepository>(
    () => SettingsRepositoryImpl(
      settingsDatasource: locator(),
    ),
  );

  //register blocs
  locator.registerFactory<AgentBloc>(
    () => AgentBloc(
      agentRepository: locator(),
    ),
  );
  locator.registerSingleton<SettingsBloc>(
    SettingsBloc(settingsRepository: locator()),
  );
}
