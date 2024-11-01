import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:valorant_intel/features/agents/data/datasources/remote/agent_remote_datasource.dart';

final GetIt locator = GetIt.instance;

Future<void> initGetIt() async {
  // Register Dio as a singleton
  locator.registerLazySingleton<Dio>(() => Dio());

  //register data source
  locator.registerLazySingleton<AgentRemoteDatasource>(
      () => AgentRemoteDatasource(dio: locator()));
}
