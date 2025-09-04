import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class AnimatedMapImage extends StatelessWidget {
  const AnimatedMapImage({
    super.key,
    required this.mapImageUrl,
  });

  final String? mapImageUrl;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: mapImageUrl ?? "",
      flightShuttleBuilder:
          (
            flightContext,
            animation,
            flightDirection,
            fromHeroContext,
            toHeroContext,
          ) {
            Animation<double> borderAnimation = Tween<double>(
              begin: 12,
              end: 0,
            ).animate(animation);

            return AnimatedBuilder(
              animation: borderAnimation,
              builder: (context, child) {
                return Material(
                  surfaceTintColor: Colors.transparent,
                  color: Colors.transparent,
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(
                      Radius.circular(borderAnimation.value),
                    ),
                    child: getFixedImage(),
                  ),
                );
              },
            );
          },
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(0)),
        child: getFixedImage(),
      ),
    );
  }

  Widget getFixedImage() {
    return Transform.scale(
      scale: 1.02,
      child: CachedNetworkImage(
        imageUrl: mapImageUrl ?? "",
        width: double.infinity,
        filterQuality: FilterQuality.low,
        height: double.infinity,
        fit: BoxFit.cover,
      ),
    );
  }
}
