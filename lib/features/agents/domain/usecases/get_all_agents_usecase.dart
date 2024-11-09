import 'package:valorant_intel/core/common/data_state.dart';
import 'package:valorant_intel/core/usecases/use_case.dart';
import 'package:valorant_intel/features/agents/domain/entities/agent_entity.dart';
import 'package:valorant_intel/features/agents/domain/repositories/agent_repository.dart';

class GetAllAgentsUsecase
    implements UseCase<DataState<List<AgentEntity>>, void> {
  final AgentRepository _agentRepository;

  GetAllAgentsUsecase({required AgentRepository agentRepository})
      : _agentRepository = agentRepository;

  @override
  Future<DataState<List<AgentEntity>>> call(void param) {
    return _agentRepository.getAllAgents();
  }
}
