import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:shimmer/shimmer.dart';
import 'package:valorant_intel/config/themes/colors.dart';
import 'package:valorant_intel/core/extensions/context_extensions.dart';
import 'package:valorant_intel/features/feature_agent/domain/entities/agent_entity.dart';
import 'package:valorant_intel/features/feature_agent/presentation/blocs/agent_bloc.dart';
import 'package:valorant_intel/features/feature_agent/presentation/pages/agent_card.dart';

class AgentsPage extends StatelessWidget {
  const AgentsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AgentBloc, AgentState>(
        builder: (context, state) {
          return switch (state) {
            AgentLoadingState() => const AgentLoadingView(),
            AgentSuccessState(agentEntityList: final agentEntityList) =>
              AgentSuccessView(agentEntityList: agentEntityList),
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
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: gridColumnCount / 0.3),
          child: Shimmer.fromColors(
            baseColor: AppColors.grey,
            highlightColor: AppColors.white,
            child: GridView.builder(
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
            context.translate(message),
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: () => context.read<AgentBloc>().add(GetAllAgentsEvent()),
            child: Text(
              AppLocalizations.of(context)!.tryAgain,
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
    required this.agentEntityList,
  });

  final List<AgentEntity> agentEntityList;

  @override
  State<AgentSuccessView> createState() => _AgentSuccessViewState();
}

class _AgentSuccessViewState extends State<AgentSuccessView> {
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
                          AppLocalizations.of(context)!.pullToRefresh,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
            SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: gridColumnCount / 0.3),
              sliver: SliverGrid.builder(
                itemCount: widget.agentEntityList.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: gridColumnCount,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  mainAxisExtent: 150,
                ),
                itemBuilder: (context, index) {
                  return AgentCard(agentEntity: widget.agentEntityList[index]);
                },
              ),
            ),
          ],
        ),
      );
    });
  }
}
