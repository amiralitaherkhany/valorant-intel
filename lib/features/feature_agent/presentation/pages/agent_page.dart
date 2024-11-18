import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:valorant_intel/core/widgets/custom_loading_widget.dart';
import 'package:valorant_intel/features/feature_agent/domain/entities/agent_entity.dart';
import 'package:valorant_intel/features/feature_agent/presentation/blocs/agent_bloc.dart';

class AgentsPage extends StatelessWidget {
  const AgentsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AgentBloc, AgentState>(
        builder: (context, state) {
          return switch (state) {
            AgentLoading() => const Center(
                child: CustomLoadingWidget(),
              ),
            AgentSuccess(agentEntityList: final agentEntityList) =>
              AgentSuccessView(agentEntityList: agentEntityList),
            AgentError(message: final message) => Center(
                child: AgentErrorView(message: message),
              )
          };
        },
      ),
    );
  }
}

class AgentErrorView extends StatelessWidget {
  const AgentErrorView({
    super.key,
    required this.message,
  });

  final String message;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            message,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: () => context.read<AgentBloc>().add(GetAllAgentsEvent()),
            child: const Text(
              'Try Again',
            ),
          ),
        ],
      ),
    );
  }
}

class AgentSuccessView extends StatelessWidget {
  const AgentSuccessView({
    super.key,
    required this.agentEntityList,
  });

  final List<AgentEntity> agentEntityList;

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      color: Theme.of(context).indicatorColor,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      onRefresh: () async {
        context.read<AgentBloc>().add(GetAllAgentsEvent());
      },
      child: ListView.builder(
        itemCount: agentEntityList.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(agentEntityList[index].displayName!),
          );
        },
      ),
    );
  }
}
