import 'package:valorant_intel/features/feature_agent/data/models/agent.dart';

abstract interface class AgentRemoteDatasource {
  Future<List<Agent>> getAllAgents();
}
