import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:valorant_intel/features/feature_map/data/models/callout.dart';

class MapWithCallouts extends StatelessWidget {
  const MapWithCallouts({
    super.key,
    required this.mapCallouts,
    required this.mapDisplayIconUrl,
    required this.xMultiplier,
    required this.yMultiplier,
    required this.xScalarToAdd,
    required this.yScalarToAdd,
  });

  final List<Callout>? mapCallouts;
  final String? mapDisplayIconUrl;
  final double xMultiplier;
  final double yMultiplier;
  final double xScalarToAdd;
  final double yScalarToAdd;

  static const displayWidth = 500.0;
  static const displayHeight = 500.0;

  @override
  Widget build(BuildContext context) {
    if (mapDisplayIconUrl != null) {
      return SliverToBoxAdapter(
        child: SizedBox(
          width: displayWidth,
          height: displayHeight,
          child: Stack(
            children: [
              Transform.rotate(
                angle: -pi / 2,
                child: CachedNetworkImage(
                  imageUrl: mapDisplayIconUrl!,
                  width: displayWidth,
                  height: displayHeight,
                  fit: BoxFit.contain,
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
              if (mapCallouts != null)
                ...List.generate(
                  mapCallouts!.length,
                  (index) {
                    final callout = mapCallouts![index];
                    final gameX = callout.location?.x ?? 0.0;
                    final gameY = callout.location?.y ?? 0.0;

                    final double normalizedX =
                        (gameX * xMultiplier) + xScalarToAdd;
                    final double normalizedY =
                        (gameY * yMultiplier) + yScalarToAdd;

                    final double left = normalizedX * displayWidth;
                    final double top = (1.0 - normalizedY) * displayHeight;

                    return Positioned(
                      left: left,
                      top: top,
                      child: Tooltip(
                        message: callout.regionName ?? 'Unknown',
                        child: Container(
                          width: 12,
                          height: 12,
                          decoration: BoxDecoration(
                            color: callout.regionName == "Site"
                                ? Colors.red
                                : Colors.blue,
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.white, width: 2),
                          ),
                        ),
                      ),
                    );
                  },
                ),
            ],
          ),
        ),
      );
    } else {
      return const SliverToBoxAdapter(
        child: Icon(
          Icons.image_not_supported,
          color: Colors.white,
          size: 75,
        ),
      );
    }
  }
}
