import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:valorant_intel/core/usecases/use_case.dart';
import 'package:valorant_intel/features/feature_agent/domain/entities/agent_entity.dart';
import 'package:valorant_intel/features/feature_agent/domain/usecases/get_all_agents_usecase.dart';

part 'agent_event.dart';
part 'agent_state.dart';

class AgentBloc extends Bloc<AgentEvent, AgentState> {
  final GetAllAgentsUsecase getAllAgentsUsecase;
  AgentBloc({required this.getAllAgentsUsecase}) : super(AgentLoadingState()) {
    on<GetAllAgentsEvent>((event, emit) async {
      emit(AgentLoadingState());
      await getAllAgentsUsecase(NoParams()).then(
        (value) => value.fold(
          (error) => emit(AgentErrorState(message: error)),
          (agentEntityList) =>
              emit(AgentSuccessState(agentEntityList: agentEntityList)),
        ),
      );
    });
  }
}
