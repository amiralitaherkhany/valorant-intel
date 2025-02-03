import 'package:valorant_intel/features/feature_agent/data/models/agent/agent.dart';

abstract class AgentDatasource {
  Future<List<Agent>> getAllAgents();
}
