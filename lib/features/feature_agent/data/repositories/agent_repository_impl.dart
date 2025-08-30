import 'package:dartz/dartz.dart';
import 'package:valorant_intel/core/exceptions/api_exception.dart';
import 'package:valorant_intel/features/feature_agent/data/datasources/local/agent_local_datasource.dart';
import 'package:valorant_intel/features/feature_agent/data/datasources/remote/agent_remote_datasource.dart';
import 'package:valorant_intel/features/feature_agent/data/models/agent.dart';
import 'package:valorant_intel/features/feature_agent/data/repositories/agent_repository.dart';

class AgentRepositoryImpl implements AgentRepository {
  final AgentRemoteDatasource _agentRemoteDatasource;
  final AgentLocalDatasource _agentLocalDatasource;

  AgentRepositoryImpl({
    required AgentRemoteDatasource agentRemoteDatasource,
    required AgentLocalDatasource agentLocalDatasource,
  }) : _agentRemoteDatasource = agentRemoteDatasource,
       _agentLocalDatasource = agentLocalDatasource;

  @override
  Future<Either<(String, List<Agent>?), List<Agent>>> getAllAgents() async {
    try {
      final agents = await _agentRemoteDatasource.getAllAgents();
      await _agentLocalDatasource.saveAgents(agents);
      return Right(agents);
    } on ApiException catch (exception) {
      final agents = await _agentLocalDatasource.getAllAgents();
      if (agents.isNotEmpty) {
        return Left((exception.message, agents));
      } else {
        return Left((exception.message, null));
      }
    }
  }
}
