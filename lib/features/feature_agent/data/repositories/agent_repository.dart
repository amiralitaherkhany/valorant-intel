import 'package:dartz/dartz.dart';
import 'package:valorant_intel/features/feature_agent/data/models/agent/agent.dart';

abstract class AgentRepository {
  Future<Either<String, List<Agent>>> getAllAgents();
}
