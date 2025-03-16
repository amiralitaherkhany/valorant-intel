import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:valorant_intel/features/feature_agent/data/models/agent.dart';
import 'package:valorant_intel/features/feature_agent/data/repositories/agent_repository.dart';

part 'agent_event.dart';
part 'agent_state.dart';

class AgentBloc extends HydratedBloc<AgentEvent, AgentState> {
  final AgentRepository _agentRepository;
  AgentBloc({required AgentRepository agentRepository})
      : _agentRepository = agentRepository,
        super(AgentLoadingState()) {
    on<GetAllAgentsEvent>(
      (event, emit) async {
        final cachedState = state;
        emit(AgentLoadingState());
        await _agentRepository.getAllAgents().then(
              (response) => response.fold(
                (error) {
                  if (cachedState is AgentSuccessState) {
                    emit(AgentSuccessState(
                        agentList: cachedState.agentList, isFromCache: true));
                  } else {
                    emit(AgentErrorState(message: error));
                  }
                },
                (agentList) => emit(AgentSuccessState(
                    agentList: agentList, isFromCache: false)),
              ),
            );
      },
    );
  }

  @override
  AgentState? fromJson(Map<String, dynamic> json) {
    try {
      final agentList = (json['agentList'] as List)
          .map((e) => Agent.fromMap(e as Map<String, dynamic>))
          .toList();
      return AgentSuccessState(agentList: agentList);
    } catch (_) {
      return null;
    }
  }

  @override
  Map<String, dynamic>? toJson(AgentState state) {
    if (state is AgentSuccessState) {
      return {'agentList': state.agentList.map((e) => e.toMap()).toList()};
    }
    return null;
  }
}
