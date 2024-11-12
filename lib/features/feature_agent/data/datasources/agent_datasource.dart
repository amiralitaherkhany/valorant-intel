import 'package:valorant_intel/features/feature_agent/data/models/agent_model/agent_model.dart';

abstract class AgentDatasource {
  Future<List<AgentModel>> getAllAgents();
}
