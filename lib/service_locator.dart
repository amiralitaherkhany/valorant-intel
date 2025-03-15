import 'package:get_it/get_it.dart';
import 'package:valorant_intel/core/network/dio_client.dart';
import 'package:valorant_intel/core/utils/network_utils.dart';
import 'package:valorant_intel/features/feature_agent/bloc/agent_bloc.dart';
import 'package:valorant_intel/features/feature_agent/data/datasources/agent_datasource.dart';
import 'package:valorant_intel/features/feature_agent/data/datasources/remote/agent_remote_datasource.dart';
import 'package:valorant_intel/features/feature_agent/data/repositories/agent_repository.dart';
import 'package:valorant_intel/features/feature_agent/data/repositories/agent_repository_impl.dart';
import 'package:valorant_intel/features/feature_map/bloc/map_bloc.dart';
import 'package:valorant_intel/features/feature_map/data/datasources/map_datasource.dart';
import 'package:valorant_intel/features/feature_map/data/datasources/remote/map_remote_datasource.dart';
import 'package:valorant_intel/features/feature_map/data/repositories/map_repository.dart';
import 'package:valorant_intel/features/feature_map/data/repositories/map_repository_impl.dart';
import 'package:valorant_intel/features/feature_settings/bloc/settings_bloc.dart';

final GetIt locator = GetIt.instance;

Future<void> initializeServiceLocator() async {
  // Register components as a singleton
  locator.registerSingleton<SettingsBloc>(
    SettingsBloc(),
  );
  locator.registerSingleton<NetworkUtils>(
    NetworkUtils(
      settingsBloc: locator(),
    ),
  );
  locator.registerLazySingleton<DioClient>(
    () => DioClient(
      networkUtils: locator(),
    ),
  );

  //register dataSources
  locator.registerFactory<AgentDatasource>(
    () => AgentRemoteDatasource(
      dioClient: locator(),
    ),
  );
  locator.registerFactory<MapDatasource>(
    () => MapRemoteDatasource(
      dioClient: locator(),
    ),
  );

  //register repositories
  locator.registerFactory<AgentRepository>(
    () => AgentRepositoryImpl(
      agentDatasource: locator(),
    ),
  );
  locator.registerFactory<MapRepository>(
    () => MapRepositoryImpl(
      mapDatasource: locator(),
    ),
  );

  //register blocs
  locator.registerFactory<AgentBloc>(
    () => AgentBloc(
      agentRepository: locator(),
    ),
  );
  locator.registerFactory<MapBloc>(
    () => MapBloc(
      mapRepository: locator(),
    ),
  );
}
