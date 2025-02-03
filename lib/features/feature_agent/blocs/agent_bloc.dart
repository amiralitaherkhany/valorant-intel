import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:valorant_intel/features/feature_agent/data/models/agent/agent.dart';
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
                (error) => emit(AgentErrorState(message: error)),
                (agentList) => emit(AgentSuccessState(agentList: agentList)),
              ),
            );
      },
    );
  }
}
