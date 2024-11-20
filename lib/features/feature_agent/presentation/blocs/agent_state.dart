part of 'agent_bloc.dart';

sealed class AgentState extends Equatable {
  const AgentState();

  @override
  List<Object?> get props => [];
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
