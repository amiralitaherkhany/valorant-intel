import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:valorant_intel/core/constants/api_constants.dart';
import 'package:valorant_intel/features/feature_agent/data/datasources/agent_datasource.dart';
import 'package:valorant_intel/features/feature_agent/data/datasources/remote/agent_remote_datasource.dart';
import 'package:valorant_intel/features/feature_agent/data/repositories/agent_repository_impl.dart';
import 'package:valorant_intel/features/feature_agent/domain/repositories/agent_repository.dart';
import 'package:valorant_intel/features/feature_agent/domain/usecases/get_all_agents_usecase.dart';
import 'package:valorant_intel/features/feature_agent/presentation/blocs/agent_bloc.dart';
import 'package:valorant_intel/features/feature_settings/data/datasources/local/settings_local_datasource.dart';
import 'package:valorant_intel/features/feature_settings/data/datasources/settings_datasource.dart';
import 'package:valorant_intel/features/feature_settings/data/repositories/settings_repository_impl.dart';
import 'package:valorant_intel/features/feature_settings/domain/repositories/settings_repository.dart';
import 'package:valorant_intel/features/feature_settings/domain/usecases/get_language_usecase.dart';
import 'package:valorant_intel/features/feature_settings/domain/usecases/get_theme_mode_usecase.dart';
import 'package:valorant_intel/features/feature_settings/domain/usecases/set_language_usecase.dart';
import 'package:valorant_intel/features/feature_settings/domain/usecases/set_theme_mode_usecase.dart';
import 'package:valorant_intel/features/feature_settings/presentation/blocs/bloc/settings_bloc.dart';

final GetIt locator = GetIt.instance;

Future<void> initGetIt() async {
  // Register components as a singleton
  locator.registerLazySingleton<Dio>(
    () => Dio(BaseOptions(baseUrl: ApiConstants.baseUrl)),
  );
  locator.registerSingleton<SharedPreferences>(
    await SharedPreferences.getInstance(),
  );
  //register dataSources
  locator.registerFactory<AgentDatasource>(
    () => AgentRemoteDatasource(
      dio: locator(),
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

  //register useCases
  locator.registerFactory<GetAllAgentsUsecase>(
    () => GetAllAgentsUsecase(
      agentRepository: locator(),
    ),
  );
  locator.registerFactory<SetThemeModeUsecase>(
    () => SetThemeModeUsecase(
      settingsRepository: locator(),
    ),
  );
  locator.registerFactory<GetThemeModeUsecase>(
    () => GetThemeModeUsecase(
      settingsRepository: locator(),
    ),
  );

  locator.registerFactory<SetLanguageUsecase>(
    () => SetLanguageUsecase(
      settingsRepository: locator(),
    ),
  );
  locator.registerFactory<GetLanguageUsecase>(
    () => GetLanguageUsecase(
      settingsRepository: locator(),
    ),
  );

  //register blocs
  locator.registerFactory<AgentBloc>(
    () => AgentBloc(
      getAllAgentsUsecase: locator(),
    ),
  );
  locator.registerSingleton<SettingsBloc>(
    SettingsBloc(
      getThemeModeUsecase: locator(),
      setThemeModeUsecase: locator(),
      getLanguageUsecase: locator(),
      setLanguageUsecase: locator(),
    ),
  );
}
