part of 'agent_bloc.dart';

sealed class AgentState {
  const AgentState();
}

final class AgentLoading extends AgentState {}

final class AgentSuccess extends AgentState {
  final List<AgentEntity> agentEntityList;
  const AgentSuccess({required this.agentEntityList});
}

final class AgentError extends AgentState {
  final String message;
  const AgentError({required this.message});
}
