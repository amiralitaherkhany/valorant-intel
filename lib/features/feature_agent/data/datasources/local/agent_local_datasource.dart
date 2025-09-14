import 'package:valorant_intel/features/feature_agent/data/models/agent.dart';

abstract interface class AgentLocalDatasource {
  Future<List<Agent>> getAllAgents();
  Future<void> saveAllAgents(List<Agent> agents);
}
