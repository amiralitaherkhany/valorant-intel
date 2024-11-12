import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:valorant_intel/core/constants/api_constants.dart';
import 'package:valorant_intel/features/feature_agent/data/datasources/agent_datasource.dart';
import 'package:valorant_intel/features/feature_agent/data/datasources/remote/agent_remote_datasource.dart';
import 'package:valorant_intel/features/feature_agent/data/repositories/agent_repository_impl.dart';
import 'package:valorant_intel/features/feature_agent/domain/repositories/agent_repository.dart';
import 'package:valorant_intel/features/feature_agent/domain/usecases/get_all_agents_usecase.dart';
import 'package:valorant_intel/features/feature_agent/presentation/blocs/agent_bloc.dart';

final GetIt locator = GetIt.instance;

Future<void> initGetIt() async {
  // Register Dio as a singleton
  locator.registerLazySingleton<Dio>(
    () => Dio(BaseOptions(baseUrl: ApiConstants.baseUrl)),
  );

  //register dataSources
  locator.registerFactory<AgentDatasource>(
    () => AgentRemoteDatasource(
      dio: locator(),
    ),
  );
  //register repositories
  locator.registerFactory<AgentRepository>(
    () => AgentRepositoryImpl(
      agentDatasource: locator(),
    ),
  );

  //register useCases
  locator.registerFactory<GetAllAgentsUsecase>(
    () => GetAllAgentsUsecase(
      agentRepository: locator(),
    ),
  );

  //register blocs
  locator.registerFactory<AgentBloc>(
    () => AgentBloc(
      getAllAgentsUsecase: locator(),
    ),
  );
}
