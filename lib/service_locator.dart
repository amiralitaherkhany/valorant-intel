import 'package:get_it/get_it.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sembast/sembast_io.dart';
import 'package:valorant_intel/core/network/dio_client.dart';
import 'package:valorant_intel/core/utils/network_utils.dart';
import 'package:valorant_intel/features/feature_agent/bloc/agent_bloc.dart';
import 'package:valorant_intel/features/feature_agent/data/datasources/local/agent_local_datasource.dart';
import 'package:valorant_intel/features/feature_agent/data/datasources/local/agent_local_datasource_impl.dart';
import 'package:valorant_intel/features/feature_agent/data/datasources/remote/agent_remote_datasource.dart';
import 'package:valorant_intel/features/feature_agent/data/datasources/remote/agent_remote_datasource_impl.dart';
import 'package:valorant_intel/features/feature_agent/data/repositories/agent_repository.dart';
import 'package:valorant_intel/features/feature_agent/data/repositories/agent_repository_impl.dart';
import 'package:valorant_intel/features/feature_map/bloc/map_bloc.dart';
import 'package:valorant_intel/features/feature_map/data/datasources/local/map_local_datasource.dart';
import 'package:valorant_intel/features/feature_map/data/datasources/remote/map_remote_datasource.dart';
import 'package:valorant_intel/features/feature_map/data/repositories/map_repository.dart';
import 'package:valorant_intel/features/feature_map/data/repositories/map_repository_impl.dart';
import 'package:valorant_intel/features/feature_settings/bloc/settings_bloc.dart';
import 'package:valorant_intel/features/feature_weapon/bloc/weapon_bloc.dart';
import 'package:valorant_intel/features/feature_weapon/data/datasources/local/weapon_local_datasource.dart';
import 'package:valorant_intel/features/feature_weapon/data/datasources/remote/weapon_remote_datasource.dart';
import 'package:valorant_intel/features/feature_weapon/data/repositories/weapon_repository.dart';
import 'package:valorant_intel/features/feature_weapon/data/repositories/weapon_repository_impl.dart';

final GetIt locator = GetIt.instance;

Future<void> initializeServiceLocator() async {
  // Register components as a singleton
  registerSingletons();

  //register local database
  await _initSembast();

  //register dataSources
  registerDatasources();

  //register repositories
  registerRepositories();

  //register blocs
  registerBlocs();
}

void registerBlocs() {
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
  locator.registerFactory<WeaponBloc>(
    () => WeaponBloc(
      weaponRepository: locator(),
    ),
  );
}

void registerRepositories() {
  locator.registerFactory<AgentRepository>(
    () => AgentRepositoryImpl(
      agentRemoteDatasource: locator(),
      agentLocalDatasource: locator(),
    ),
  );
  locator.registerFactory<MapRepository>(
    () => MapRepositoryImpl(
      mapRemoteDatasource: locator(),
      mapLocalDatasource: locator(),
    ),
  );
  locator.registerFactory<WeaponRepository>(
    () => WeaponRepositoryImpl(
      weaponRemoteDatasource: locator(),
      weaponLocalDatasource: locator(),
    ),
  );
}

void registerDatasources() {
  locator.registerFactory<AgentRemoteDatasource>(
    () => AgentRemoteDatasourceImpl(
      dioClient: locator(),
    ),
  );
  locator.registerFactory<AgentLocalDatasource>(
    () => AgentLocalDatasourceImpl(
      database: locator(),
    ),
  );
  locator.registerFactory<MapRemoteDatasource>(
    () => MapRemoteDatasource(
      dioClient: locator(),
    ),
  );
  locator.registerFactory<MapLocalDatasource>(
    () => MapLocalDatasource(
      database: locator(),
    ),
  );
  locator.registerFactory<WeaponRemoteDatasource>(
    () => WeaponRemoteDatasource(
      dioClient: locator(),
    ),
  );
  locator.registerFactory<WeaponLocalDatasource>(
    () => WeaponLocalDatasource(
      database: locator(),
    ),
  );
}

void registerSingletons() {
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
}

Future<void> _initSembast() async {
  final appDir = await getApplicationDocumentsDirectory();
  await appDir.create(recursive: true);
  final databasePath = join(appDir.path, "sembast.db");
  final database = await databaseFactoryIo.openDatabase(databasePath);
  locator.registerSingleton<Database>(database);
}
