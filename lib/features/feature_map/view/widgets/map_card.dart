import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:valorant_intel/features/feature_map/data/models/game_map.dart';

class MapCard extends StatelessWidget {
  const MapCard({super.key, required this.map});
  final GameMap map;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.go("/Game/Maps/MapDetail", extra: map);
      },
      child: Container(
        height: 100,
        width: double.infinity,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(12)),
          color: Colors.transparent,
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Hero(
              tag: map.listViewIcon ?? "",
              flightShuttleBuilder:
                  (
                    flightContext,
                    animation,
                    flightDirection,
                    fromHeroContext,
                    toHeroContext,
                  ) {
                    final borderAnimation = Tween<double>(
                      begin: 12,
                      end: 0,
                    ).animate(animation);

                    return AnimatedBuilder(
                      animation: borderAnimation,
                      builder: (context, child) {
                        return Material(
                          color: Colors.transparent,
                          surfaceTintColor: Colors.transparent,
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
                borderRadius: const BorderRadius.all(Radius.circular(12)),
                child: getFixedImage(),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(12),
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.transparent, Colors.black],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(12),
                    bottomRight: Radius.circular(12),
                  ),
                ),
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Hero(
                    transitionOnUserGestures: true,
                    tag: map.displayName ?? "",
                    flightShuttleBuilder:
                        (
                          flightContext,
                          animation,
                          flightDirection,
                          fromHeroContext,
                          toHeroContext,
                        ) {
                          final textAnimation = Tween<double>(
                            begin: 35.0,
                            end: 40.0,
                          ).animate(animation);

                          return FittedBox(
                            child: Text(
                              "${map.displayName} ",
                              style: Theme.of(context).textTheme.displayLarge
                                  ?.copyWith(
                                    fontSize: textAnimation.value,
                                  ),
                            ),
                          );
                        },
                    child: FittedBox(
                      child: Text(
                        "${map.displayName} ",
                        style: Theme.of(
                          context,
                        ).textTheme.displayLarge?.copyWith(fontSize: 35.0),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Transform getFixedImage() {
    return Transform.scale(
      scale: 1.02,
      child: CachedNetworkImage(
        imageUrl: map.listViewIcon ?? "",
        width: double.infinity,
        filterQuality: FilterQuality.low,
        height: double.infinity,
        fit: BoxFit.cover,
      ),
    );
  }
}
