import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:valorant_intel/features/feature_agent/bloc/agent_bloc.dart';
import 'package:valorant_intel/features/feature_agent/data/repositories/agent_repository_impl.dart';

// Generate mock class using Mockito
import '../data/models/agent/agent_fake.dart';
@GenerateMocks([AgentRepositoryImpl])
import 'agent_bloc_test.mocks.dart';

void main() {
  late MockAgentRepositoryImpl mockAgentRepositoryImpl;
  late AgentBloc agentBloc;

  setUp(() {
    mockAgentRepositoryImpl = MockAgentRepositoryImpl();
    agentBloc = AgentBloc(agentRepository: mockAgentRepositoryImpl);
  });

  group(
    'agent bloc tests',
    () {
      test('initial state should be AgentLoadingState', () {
        expect(agentBloc.state, isA<AgentLoadingState>());
      });

      blocTest<AgentBloc, AgentState>(
        'emits [AgentLoadingState, AgentSuccessState] when getAllAgents returns data',
        build: () {
          when(mockAgentRepositoryImpl.getAllAgents()).thenAnswer(
            (_) async => Future.value(Right([createFakeAgent()])),
          );
          return agentBloc;
        },
        act: (bloc) => bloc.add(GetAllAgentsEvent()),
        expect: () => [
          isA<AgentLoadingState>(),
          isA<AgentSuccessState>().having(
            (state) => state.agentList,
            'agentList',
            [
              createFakeAgent(),
            ],
          ),
        ],
        verify: (_) {
          verify(mockAgentRepositoryImpl.getAllAgents()).called(1);
        },
      );

      blocTest<AgentBloc, AgentState>(
        'emits [AgentLoadingState, AgentErrorState] when getAllAgents returns error',
        build: () {
          when(mockAgentRepositoryImpl.getAllAgents()).thenAnswer(
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
          verify(mockAgentRepositoryImpl.getAllAgents()).called(1);
        },
      );

      tearDown(() {
        agentBloc.close();
      });
    },
  );
}
