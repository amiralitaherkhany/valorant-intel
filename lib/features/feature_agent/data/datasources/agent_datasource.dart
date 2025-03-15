import 'package:valorant_intel/features/feature_agent/data/models/agent.dart';

abstract interface class AgentDatasource {
  Future<List<Agent>> getAllAgents();
}
