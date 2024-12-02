part of 'agent_bloc.dart';

sealed class AgentState extends Equatable {
  const AgentState();

  @override
  List<Object?> get props => [];
}

final class AgentLoadingState extends AgentState {}

final class AgentSuccessState extends AgentState {
  final List<AgentEntity> agentEntityList;
  const AgentSuccessState({required this.agentEntityList});

  @override
  List<Object?> get props => [agentEntityList];
}

final class AgentErrorState extends AgentState {
  final String message;
  const AgentErrorState({required this.message});

  @override
  List<Object?> get props => [message];
}
