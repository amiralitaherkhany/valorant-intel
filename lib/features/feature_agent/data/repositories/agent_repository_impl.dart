import 'package:dartz/dartz.dart';
import 'package:valorant_intel/core/errors/api_exception.dart';
import 'package:valorant_intel/features/feature_agent/data/datasources/agent_datasource.dart';
import 'package:valorant_intel/features/feature_agent/data/models/agent.dart';
import 'package:valorant_intel/features/feature_agent/data/repositories/agent_repository.dart';

class AgentRepositoryImpl implements AgentRepository {
  final AgentDatasource _agentDatasource;

  AgentRepositoryImpl({required AgentDatasource agentDatasource})
      : _agentDatasource = agentDatasource;
  @override
  Future<Either<String, List<Agent>>> getAllAgents() async {
    try {
      return await _agentDatasource.getAllAgents().then(
            (agentList) => right(agentList),
          );
    } on ApiException catch (exception) {
      return left(exception.message);
    }
  }
}
