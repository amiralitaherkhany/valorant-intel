import 'package:get_it/get_it.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sembast/sembast_io.dart';
import 'package:valorant_intel/core/network/dio_client.dart';
import 'package:valorant_intel/core/utils/network_utils.dart';
import 'package:valorant_intel/features/feature_agent/bloc/agent_bloc.dart';
import 'package:valorant_intel/features/feature_agent/data/datasources/local/agent_local_datasource.dart';
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
  await _initSembast();
  //register dataSources
  locator.registerFactory<AgentRemoteDatasource>(
    () => AgentRemoteDatasource(
      dioClient: locator(),
    ),
  );
  locator.registerFactory<AgentLocalDatasource>(
    () => AgentLocalDatasource(
      database: locator(),
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
      agentRemoteDatasource: locator(),
      agentLocalDatasource: locator(),
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

Future<void> _initSembast() async {
  final appDir = await getApplicationDocumentsDirectory();
  await appDir.create(recursive: true);
  final databasePath = join(appDir.path, "sembast.db");
  final database = await databaseFactoryIo.openDatabase(databasePath);
  locator.registerSingleton<Database>(database);
}
