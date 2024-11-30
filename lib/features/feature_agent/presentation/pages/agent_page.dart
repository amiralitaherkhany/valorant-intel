import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:valorant_intel/config/themes/colors.dart';
import 'package:valorant_intel/core/extensions/context_extensions.dart';
import 'package:valorant_intel/core/widgets/custom_loading_widget.dart';
import 'package:valorant_intel/features/feature_agent/domain/entities/agent_entity.dart';
import 'package:valorant_intel/features/feature_agent/presentation/blocs/agent_bloc.dart';
import 'package:valorant_intel/features/feature_settings/presentation/widgets/agent_card.dart';

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

class AgentSuccessView extends StatelessWidget {
  const AgentSuccessView({
    super.key,
    required this.agentEntityList,
  });

  final List<AgentEntity> agentEntityList;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        CupertinoSliverRefreshControl(
          refreshIndicatorExtent: 50,
          refreshTriggerPullDistance: 50,
          onRefresh: () async {
            HapticFeedback.vibrate();
            context.read<AgentBloc>().add(GetAllAgentsEvent());
          },
          builder: (context, refreshState, pulledExtent,
                  refreshTriggerPullDistance, refreshIndicatorExtent) =>
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
        SliverGrid.builder(
          itemCount: agentEntityList.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            mainAxisExtent: 150,
          ),
          itemBuilder: (context, index) =>
              AgentCard(agentEntity: agentEntityList[index]),
        )
      ],
    );
  }
}
