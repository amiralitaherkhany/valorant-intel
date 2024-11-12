import 'package:dartz/dartz.dart';
import 'package:valorant_intel/core/errors/api_exception.dart';
import 'package:valorant_intel/features/agents/data/datasources/agent_datasource.dart';
import 'package:valorant_intel/features/agents/domain/entities/agent_entity.dart';
import 'package:valorant_intel/features/agents/domain/repositories/agent_repository.dart';

class AgentRepositoryImpl implements AgentRepository {
  final AgentDatasource _agentDatasource;

  AgentRepositoryImpl({required AgentDatasource agentDatasource})
      : _agentDatasource = agentDatasource;
  @override
  Future<Either<String, List<AgentEntity>>> getAllAgents() async {
    try {
      final agentModelList = await _agentDatasource.getAllAgents();
      final agentEntityList =
          agentModelList.map<AgentEntity>((e) => e.toEntity()).toList();

      return right(agentEntityList);
    } on ApiException catch (e) {
      return left(e.message);
    }
  }
}
