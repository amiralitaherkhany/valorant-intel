import 'package:flutter/material.dart';
import 'package:valorant_intel/features/feature_map/view/widgets/animated_map_image.dart';

class MapAppBar extends StatelessWidget {
  const MapAppBar({
    super.key,
    required this.mapImageUrl,
    required this.mapDisplayName,
  });

  final String? mapImageUrl;
  final String? mapDisplayName;
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 100 - MediaQuery.paddingOf(context).top,
      centerTitle: true,
      elevation: 0,
      scrolledUnderElevation: 0,
      pinned: false,
      floating: true,
      stretch: true,
      snap: false,
      flexibleSpace: FlexibleSpaceBar(
        background: AnimatedMapImage(mapImageUrl: mapImageUrl),
        title: Hero(
          transitionOnUserGestures: true,
          tag: mapDisplayName ?? "",
          flightShuttleBuilder:
              (
                flightContext,
                animation,
                flightDirection,
                fromHeroContext,
                toHeroContext,
              ) {
                Animation<double> textAnimation = Tween<double>(
                  begin: 40.0,
                  end: 35.0,
                ).animate(animation);
                return RepaintBoundary(
                  child: FittedBox(
                    child: Text(
                      "$mapDisplayName ",
                      style: Theme.of(context).textTheme.displayLarge?.copyWith(
                        fontSize: textAnimation.value,
                      ),
                    ),
                  ),
                );
              },
          child: FittedBox(
            child: Text(
              "$mapDisplayName ",
              style: Theme.of(
                context,
              ).textTheme.displayLarge?.copyWith(fontSize: 40.0),
            ),
          ),
        ),
        centerTitle: true,
      ),
    );
  }
}
