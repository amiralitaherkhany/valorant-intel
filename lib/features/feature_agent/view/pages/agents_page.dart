import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';
import 'package:valorant_intel/config/themes/app_colors.dart';
import 'package:valorant_intel/core/extensions/context_extensions.dart';
import 'package:valorant_intel/core/widgets/custom_error_view.dart';
import 'package:valorant_intel/core/widgets/custom_sliver_refresh_control.dart';
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
          if (state is AgentSuccessState && state.isFromCache) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(context.localizations.cachedContent),
              ),
            );
          }
        },
        builder: (context, state) {
          return switch (state) {
            AgentLoadingState() => const AgentLoadingView(),
            AgentSuccessState(agentList: final agentList) =>
              AgentSuccessView(agentList: agentList),
            AgentErrorState(message: final message) => CustomErrorView(
                message: message,
                onTryAgain: () =>
                    context.read<AgentBloc>().add(GetAllAgentsEvent()),
              )
          };
        },
      ),
    );
  }
}

class AgentLoadingView extends StatelessWidget {
  const AgentLoadingView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverPadding(
          padding: EdgeInsets.symmetric(
            horizontal: context.width / 35,
            vertical: 30,
          ),
          sliver: SliverToBoxAdapter(
            child: Shimmer.fromColors(
              baseColor: AppColors.grey,
              highlightColor: AppColors.white,
              child: GridView.builder(
                addRepaintBoundaries: true,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 10,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: context.width ~/ 200,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  mainAxisExtent: 150,
                ),
                itemBuilder: (context, index) => Container(
                  width: double.infinity,
                  height: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class AgentSuccessView extends StatefulWidget {
  const AgentSuccessView({
    super.key,
    required this.agentList,
  });

  final List<Agent> agentList;

  @override
  State<AgentSuccessView> createState() => _AgentSuccessViewState();
}

class _AgentSuccessViewState extends State<AgentSuccessView> {
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  final _controller = ScrollController();
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: _controller,
      physics: const BouncingScrollPhysics(),
      slivers: [
        CustomSliverRefreshControl(
          onRefresh: () => context.read<AgentBloc>().add(GetAllAgentsEvent()),
          controller: _controller,
        ),
        SliverPadding(
          padding: EdgeInsets.symmetric(
            horizontal: context.width > 35 ? context.width / 35 : 10,
            vertical: 30,
          ),
          sliver: SliverGrid.builder(
            itemCount: widget.agentList.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: context.width > 200 ? context.width ~/ 200 : 1,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              mainAxisExtent: 150,
            ),
            itemBuilder: (context, index) {
              return AgentCard(agent: widget.agentList[index]);
            },
          ),
        ),
      ],
    );
  }
}
