part of 'agent_bloc.dart';

sealed class AgentEvent {
  const AgentEvent();
}

class GetAllAgentsEvent extends AgentEvent {}
