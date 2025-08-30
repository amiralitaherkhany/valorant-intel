import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:valorant_intel/features/feature_agent/data/models/agent.dart';
import 'package:valorant_intel/features/feature_agent/data/repositories/agent_repository.dart';

part 'agent_event.dart';
part 'agent_state.dart';

class AgentBloc extends Bloc<AgentEvent, AgentState> {
  final AgentRepository _agentRepository;
  AgentBloc({required AgentRepository agentRepository})
    : _agentRepository = agentRepository,
      super(AgentLoadingState()) {
    on<GetAllAgentsEvent>(
      (event, emit) async {
        emit(AgentLoadingState());
        await _agentRepository.getAllAgents().then(
          (response) => response.fold(
            (errorDetails) {
              emit(
                AgentErrorState(
                  message: errorDetails.$1,
                  cachedAgentList: errorDetails.$2,
                ),
              );
            },
            (agentList) => emit(AgentSuccessState(agentList: agentList)),
          ),
        );
      },
    );
  }
}
