import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:valorant_intel/config/theme/app_color_scheme.dart';

class AnimatedAgentImage extends StatelessWidget {
  const AnimatedAgentImage({super.key, required this.agentImageUrl});

  final String agentImageUrl;

  @override
  Widget build(BuildContext context) {
    return Hero(
      transitionOnUserGestures: true,
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
              child: Container(color: Colors.grey, width: 100, height: 100),
            ),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
        ),
      ),
    );
  }
}
