import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:valorant_intel/config/theme/app_color_scheme.dart';
import 'package:valorant_intel/features/feature_agent/data/models/agent.dart';
import 'package:valorant_intel/features/feature_agent/view/widgets/agent_ability_list.dart';
import 'package:valorant_intel/features/feature_agent/view/widgets/agent_app_bar.dart';
import 'package:valorant_intel/features/feature_agent/view/widgets/agent_describtion.dart';

class AgentDetailPage extends StatelessWidget {
  const AgentDetailPage({super.key, required this.agent});
  final Agent agent;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          AgentAppBar(agent: agent),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            sliver: SliverToBoxAdapter(
              child: SizedBox(
                height: 110,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 1,
                      child: AnimatedAgentImage(
                        agentImageUrl: agent.displayIcon,
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            flex: 4,
                            child: FittedBox(
                              child: CachedNetworkImage(
                                color: Colors.grey,
                                width: 100,
                                height: 100,
                                imageUrl: agent.role.displayIcon,
                                placeholder: (context, url) {
                                  return Shimmer.fromColors(
                                    baseColor: AppColorScheme.grey,
                                    highlightColor: AppColorScheme.white,
                                    child: Container(
                                      width: 100,
                                      height: 100,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: Colors.white,
                                      ),
                                    ),
                                  );
                                },
                                errorWidget: (context, url, error) =>
                                    const Icon(Icons.error),
                              ),
                            ),
                          ),
                          const Spacer(flex: 1),
                          Expanded(
                            flex: 1,
                            child: FittedBox(
                              child: Text(
                                agent.role.displayName,
                                style: Theme.of(
                                  context,
                                ).textTheme.bodyMedium?.copyWith(fontSize: 20),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SliverToBoxAdapter(
            child: Divider(indent: 20, endIndent: 20),
          ),
          SliverPadding(
            padding: const EdgeInsets.all(10),
            sliver: SliverToBoxAdapter(
              child: AgentDescribtion(description: agent.description),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.only(left: 10),
            sliver: SliverToBoxAdapter(
              child: AgentAbilityList(abilities: agent.abilities),
            ),
          ),
          const SliverPadding(padding: EdgeInsets.only(top: 50)),
        ],
      ),
    );
  }
}

class AnimatedAgentImage extends StatelessWidget {
  const AnimatedAgentImage({super.key, required this.agentImageUrl});

  final String agentImageUrl;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: agentImageUrl,
      child: FittedBox(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: CachedNetworkImage(
            width: 100,
            height: 100,
            imageUrl: agentImageUrl,
            placeholder: (context, url) => Shimmer.fromColors(
              baseColor: AppColorScheme.white,
              highlightColor: AppColorScheme.grey,
              child: Container(
                color: Colors.grey,
                width: 100,
                height: 100,
              ),
            ),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
        ),
      ),
    );
  }
}
