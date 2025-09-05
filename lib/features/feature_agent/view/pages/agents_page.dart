import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:valorant_intel/core/extensions/context_extensions.dart';
import 'package:valorant_intel/core/widgets/custom_error_view.dart';
import 'package:valorant_intel/core/widgets/custom_shimmer_grid_view.dart';
import 'package:valorant_intel/core/widgets/custom_sliver_refresh_wrapper.dart';
import 'package:valorant_intel/core/widgets/simple_app_bar.dart';
import 'package:valorant_intel/features/feature_agent/bloc/agent_bloc.dart';
import 'package:valorant_intel/features/feature_agent/data/models/agent.dart';
import 'package:valorant_intel/features/feature_agent/view/widgets/agent_card.dart';

class AgentsPage extends StatelessWidget {
  const AgentsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SimpleAppBar(
        title: Text(context.localizations.agents),
      ),
      body: BlocConsumer<AgentBloc, AgentState>(
        listener: (context, state) {
          if (state is AgentErrorState && state.cachedAgentList != null) {
            context.showSimpleSnackBar(
              context.localizations.cachedContent(
                context.translateError(state.message),
              ),
            );
          }
        },
        builder: (context, state) {
          return switch (state) {
            AgentLoadingState() => const CustomShimmerGridView(
              width: 150,
              height: 150,
              radius: 12,
            ),
            AgentSuccessState(:final agentList) => AgentSuccessView(
              agentList: agentList,
            ),
            AgentErrorState(
              :final message,
              :final cachedAgentList,
            ) =>
              cachedAgentList == null
                  ? CustomErrorView(
                      message: message,
                      onTryAgain: () =>
                          context.read<AgentBloc>().add(GetAllAgentsEvent()),
                    )
                  : AgentSuccessView(
                      agentList: cachedAgentList,
                    ),
          };
        },
      ),
    );
  }
}

class AgentSuccessView extends StatelessWidget {
  const AgentSuccessView({
    super.key,
    required this.agentList,
  });

  final List<Agent> agentList;

  @override
  Widget build(BuildContext context) {
    return CustomSliverRefreshWrapper(
      onRefresh: () => context.read<AgentBloc>().add(GetAllAgentsEvent()),
      slivers: [
        SliverPadding(
          padding: EdgeInsets.symmetric(
            horizontal: context.width > 35 ? context.width / 35 : 10,
            vertical: 30,
          ),
          sliver: SliverGrid.builder(
            itemCount: agentList.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: context.width > 150 ? context.width ~/ 150 : 1,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              mainAxisExtent: 150,
            ),
            itemBuilder: (context, index) {
              return AgentCard(agent: agentList[index]);
            },
          ),
        ),
      ],
    );
  }
}
