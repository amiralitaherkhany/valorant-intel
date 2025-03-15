import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';
import 'package:valorant_intel/config/themes/app_colors.dart';
import 'package:valorant_intel/core/extensions/context_extensions.dart';
import 'package:valorant_intel/features/feature_agent/bloc/agent_bloc.dart';
import 'package:valorant_intel/features/feature_agent/data/models/agent.dart';
import 'package:valorant_intel/features/feature_agent/view/widgets/agent_card.dart';

class AgentsPage extends StatelessWidget {
  const AgentsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.localizations.agents),
        centerTitle: true,
        titleTextStyle: Theme.of(context).textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
              fontSize: 30,
            ),
        elevation: 0,
        scrolledUnderElevation: 0,
      ),
      body: BlocBuilder<AgentBloc, AgentState>(
        builder: (context, state) {
          return switch (state) {
            AgentLoadingState() => const AgentLoadingView(),
            AgentSuccessState(agentList: final agentList) =>
              AgentSuccessView(agentList: agentList),
            AgentErrorState(message: final message) =>
              AgentErrorView(message: message)
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
  static late int gridColumnCount;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        switch (constraints.maxWidth) {
          case > 1440:
            gridColumnCount = 6;
          case > 1240:
            gridColumnCount = 5;
          case > 905:
            gridColumnCount = 4;
          case > 600:
            gridColumnCount = 3;
          default:
            gridColumnCount = 2;
        }
        return CustomScrollView(
          slivers: [
            SliverPadding(
              padding: EdgeInsets.symmetric(
                  horizontal: gridColumnCount / 0.3, vertical: 30),
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
                      crossAxisCount: gridColumnCount,
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
      },
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
            context.translateError(message),
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: () => context.read<AgentBloc>().add(GetAllAgentsEvent()),
            child: Text(
              context.localizations.tryAgain,
            ),
          ),
        ],
      ),
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

  final ValueNotifier _isAtTop = ValueNotifier(true);
  late int gridColumnCount;
  final _controller = ScrollController();
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, costraints) {
      switch (costraints.maxWidth) {
        case > 1440:
          gridColumnCount = 6;
        case > 1240:
          gridColumnCount = 5;
        case > 905:
          gridColumnCount = 4;
        case > 600:
          gridColumnCount = 3;
        default:
          gridColumnCount = 2;
      }
      return NotificationListener<ScrollStartNotification>(
        onNotification: (notification) {
          if (_controller.offset <= 0 && !_isAtTop.value) {
            scheduleMicrotask(() {
              if (mounted) {
                _isAtTop.value = true;
              }
            });
          } else if (_controller.offset > 0 && _isAtTop.value) {
            scheduleMicrotask(() {
              if (mounted) {
                _isAtTop.value = false;
              }
            });
          }
          return false;
        },
        child: CustomScrollView(
          controller: _controller,
          physics: const BouncingScrollPhysics(),
          slivers: [
            ListenableBuilder(
              listenable: _isAtTop,
              builder: (context, child) {
                return SliverVisibility(
                  visible: _isAtTop.value,
                  sliver: CupertinoSliverRefreshControl(
                    refreshIndicatorExtent: 50,
                    refreshTriggerPullDistance: 50,
                    onRefresh: () async {
                      HapticFeedback.vibrate();
                      context.read<AgentBloc>().add(GetAllAgentsEvent());
                    },
                    builder: (context,
                            refreshState,
                            pulledExtent,
                            refreshTriggerPullDistance,
                            refreshIndicatorExtent) =>
                        Container(
                      width: double.infinity,
                      height: double.infinity,
                      color: AppColors.mainRed,
                      child: Center(
                        child: Text(
                          context.localizations.pullToRefresh,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
            SliverPadding(
              padding: EdgeInsets.symmetric(
                  horizontal: gridColumnCount / 0.3, vertical: 30),
              sliver: SliverGrid.builder(
                itemCount: widget.agentList.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: gridColumnCount,
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
        ),
      );
    });
  }
}
