import 'package:dartz/dartz.dart';
import 'package:valorant_intel/core/usecases/use_case.dart';
import 'package:valorant_intel/features/feature_agent/domain/entities/agent_entity.dart';
import 'package:valorant_intel/features/feature_agent/domain/repositories/agent_repository.dart';

class GetAllAgentsUsecase
    implements UseCase<Future<Either<String, List<AgentEntity>>>, NoParams> {
  final AgentRepository _agentRepository;

  GetAllAgentsUsecase({required AgentRepository agentRepository})
      : _agentRepository = agentRepository;

  @override
  Future<Either<String, List<AgentEntity>>> call(NoParams params) {
    return _agentRepository.getAllAgents();
  }
}
