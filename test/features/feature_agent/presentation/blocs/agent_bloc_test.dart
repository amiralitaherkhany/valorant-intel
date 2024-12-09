import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:valorant_intel/features/feature_agent/domain/usecases/get_all_agents_usecase.dart';
import 'package:valorant_intel/features/feature_agent/presentation/blocs/agent_bloc.dart';

// Generate mock class using Mockito
import '../../domain/entities/agent_entity_fake.dart';
@GenerateMocks([GetAllAgentsUsecase])
import 'agent_bloc_test.mocks.dart';

void main() {
  late MockGetAllAgentsUsecase mockGetAllAgentsUsecase;
  late AgentBloc agentBloc;

  setUp(() {
    mockGetAllAgentsUsecase = MockGetAllAgentsUsecase();
    agentBloc = AgentBloc(getAllAgentsUsecase: mockGetAllAgentsUsecase);
  });

  group(
    'agent bloc tests',
    () {
      test('initial state should be AgentLoadingState', () {
        expect(agentBloc.state, isA<AgentLoadingState>());
      });

      blocTest<AgentBloc, AgentState>(
        'emits [AgentLoadingState, AgentSuccessState] when GetAllAgentsUsecase returns data',
        build: () {
          when(mockGetAllAgentsUsecase.call(any)).thenAnswer(
            (_) async => Future.value(Right([createFakeAgentEntity()])),
          );
          return agentBloc;
        },
        act: (bloc) => bloc.add(GetAllAgentsEvent()),
        expect: () => [
          isA<AgentLoadingState>(),
          isA<AgentSuccessState>().having(
            (state) => state.agentEntityList,
            'agentEntityList',
            [
              createFakeAgentEntity(),
            ],
          ),
        ],
        verify: (_) {
          verify(mockGetAllAgentsUsecase.call(any)).called(1);
        },
      );

      blocTest<AgentBloc, AgentState>(
        'emits [AgentLoadingState, AgentErrorState] when GetAllAgentsUsecase returns error',
        build: () {
          when(mockGetAllAgentsUsecase.call(any)).thenAnswer(
            (_) async => Future.value(const Left('Unable to fetch agents')),
          );
          return agentBloc;
        },
        act: (bloc) => bloc.add(GetAllAgentsEvent()),
        expect: () => [
          isA<AgentLoadingState>(),
          isA<AgentErrorState>().having(
              (state) => state.message, 'message', 'Unable to fetch agents'),
        ],
        verify: (_) {
          verify(mockGetAllAgentsUsecase.call(any)).called(1);
        },
      );

      tearDown(() {
        agentBloc.close();
      });
    },
  );
}
