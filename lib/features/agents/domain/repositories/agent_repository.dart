import 'package:valorant_intel/core/common/data_state.dart';
import 'package:valorant_intel/features/agents/domain/entities/agent_entity.dart';

abstract class AgentRepository {
  Future<DataState<List<AgentEntity>>> getAllAgents();
}
