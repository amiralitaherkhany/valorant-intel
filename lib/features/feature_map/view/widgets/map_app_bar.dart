import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

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
        title: AnimatedMapName(mapDisplayName: mapDisplayName),
        centerTitle: true,
      ),
    );
  }
}

class AnimatedMapName extends StatelessWidget {
  const AnimatedMapName({
    super.key,
    required this.mapDisplayName,
  });

  final String? mapDisplayName;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: mapDisplayName ?? "",
      child: FittedBox(
        child: Text(
          "$mapDisplayName ",
          style: Theme.of(
            context,
          ).textTheme.displayLarge?.copyWith(fontSize: 40.0),
        ),
      ),
    );
  }
}

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
