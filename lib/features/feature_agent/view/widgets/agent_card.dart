import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shimmer/shimmer.dart';
import 'package:valorant_intel/config/theme/app_color_scheme.dart';
import 'package:valorant_intel/features/feature_agent/data/models/agent.dart';

class AgentCard extends StatelessWidget {
  const AgentCard({super.key, required this.agent});

  final Agent agent;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.go('/Collections/Agents/AgentDetail', extra: agent);
      },
      child: Card(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                AnimatedAgentImage(agent: agent),
                const Spacer(),
                AnimatedAgentName(agent: agent),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class AnimatedAgentName extends StatelessWidget {
  const AnimatedAgentName({
    super.key,
    required this.agent,
  });

  final Agent agent;

  @override
  Widget build(BuildContext context) {
    return Hero(
      transitionOnUserGestures: true,
      tag: agent.displayName,
      flightShuttleBuilder:
          (
            flightContext,
            animation,
            flightDirection,
            fromHeroContext,
            toHeroContext,
          ) {
            Animation<double> textAnimation = Tween<double>(
              begin: 14.0,
              end: 20.0,
            ).animate(animation);
            return FittedBox(
              child: Text(
                "${agent.displayName} ",
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontSize: textAnimation.value,
                ),
              ),
            );
          },
      child: FittedBox(
        child: Text(
          "${agent.displayName} ",
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            fontSize: 14.0,
          ),
        ),
      ),
    );
  }
}

class AnimatedAgentImage extends StatelessWidget {
  const AnimatedAgentImage({
    super.key,
    required this.agent,
  });

  final Agent agent;

  @override
  Widget build(BuildContext context) {
    return Hero(
      transitionOnUserGestures: true,
      tag: agent.displayIcon,
      child: FittedBox(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: CachedNetworkImage(
            width: 100,
            height: 100,
            imageUrl: agent.displayIcon,
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
