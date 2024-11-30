import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:valorant_intel/config/themes/colors.dart';
import 'package:valorant_intel/features/feature_agent/domain/entities/agent_entity.dart';

class AgentCard extends StatelessWidget {
  const AgentCard({
    super.key,
    required this.agentEntity,
  });

  final AgentEntity agentEntity;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: CachedNetworkImage(
                  width: 100,
                  height: 100,
                  imageUrl: agentEntity.displayIcon!,
                  placeholder: (context, url) => Shimmer.fromColors(
                    baseColor: AppColors.white,
                    highlightColor: AppColors.grey,
                    child: Container(
                      color: Colors.grey,
                      width: 100,
                      height: 100,
                    ),
                  ),
                  errorWidget: (context, url, error) => const Icon(
                    Icons.error,
                  ),
                ),
              ),
              const Spacer(),
              Text(
                agentEntity.displayName!,
                style: Theme.of(context).textTheme.bodyMedium,
              )
            ],
          ),
        ),
      ),
    );
  }
}
