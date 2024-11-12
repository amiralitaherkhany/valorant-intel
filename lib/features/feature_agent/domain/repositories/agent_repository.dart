import 'package:dartz/dartz.dart';
import 'package:valorant_intel/features/feature_agent/domain/entities/agent_entity.dart';

abstract class AgentRepository {
  Future<Either<String, List<AgentEntity>>> getAllAgents();
}
