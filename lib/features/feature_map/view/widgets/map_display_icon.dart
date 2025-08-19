import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:valorant_intel/core/extensions/context_extensions.dart';

class MapDisplayIcon extends StatelessWidget {
  const MapDisplayIcon({
    super.key,
    required this.mapDisplayIconUrl,
  });

  final String? mapDisplayIconUrl;

  @override
  Widget build(BuildContext context) {
    if (mapDisplayIconUrl != null) {
      return SliverToBoxAdapter(
        child: SizedBox(
          width: context.width,
          height: context.width,
          child: Transform.rotate(
            angle: pi / 2,
            child: CachedNetworkImage(
              imageUrl: mapDisplayIconUrl!,
              width: context.width,
              height: context.width,
              fit: BoxFit.contain,
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
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
