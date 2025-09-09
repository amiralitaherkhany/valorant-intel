import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:valorant_intel/core/extensions/string_extensions.dart';
import 'package:valorant_intel/features/feature_agent/data/models/agent.dart';

class AgentAppBar extends StatelessWidget {
  const AgentAppBar({
    super.key,
    required this.agent,
  });

  final Agent agent;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      flexibleSpace: FlexibleSpaceBar(
        title: AnimatedAgentName(agentDisplayName: agent.displayName),
        background: Container(
          padding: EdgeInsets.only(
            top: MediaQuery.viewPaddingOf(context).top,
            bottom: 50,
          ),
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                for (var colorString in agent.backgroundGradientColors) ...{
                  (colorString as String).parseToColor,
                },
              ],
              begin: AlignmentDirectional.topStart,
              end: AlignmentDirectional.bottomEnd,
            ),
          ),
          child: Stack(
            fit: StackFit.expand,
            alignment: Alignment.center,
            children: [
              Positioned(
                left: -10,
                bottom: 0,
                top: 0,
                child: Opacity(
                  opacity: 0.7,
                  child: Transform.scale(
                    scale: 1.1,
                    child: CachedNetworkImage(
                      imageUrl: agent.background,
                      fit: BoxFit.contain,
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                    ),
                  ),
                ),
              ),
              CachedNetworkImage(
                imageUrl: agent.fullPortrait,
                fit: BoxFit.fitHeight,
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ],
          ),
        ),
        centerTitle: true,
      ),
      elevation: 0,
      scrolledUnderElevation: 0,
      pinned: true,
      floating: false,
      snap: false,
      stretch: true,
      expandedHeight: 450,
    );
  }
}

class AnimatedAgentName extends StatelessWidget {
  const AnimatedAgentName({
    super.key,
    required this.agentDisplayName,
  });

  final String agentDisplayName;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: agentDisplayName,
      child: FittedBox(
        child: Text(
          "$agentDisplayName ",
          style: Theme.of(
            context,
          ).textTheme.bodyMedium?.copyWith(fontSize: 20.0),
        ),
      ),
    );
  }
}
