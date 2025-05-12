import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:valorant_intel/features/feature_map/data/models/game_map.dart';

class MapDetailPage extends StatelessWidget {
  const MapDetailPage({
    super.key,
    required this.map,
  });
  final GameMap map;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            expandedHeight: 100 - MediaQuery.paddingOf(context).top,
            centerTitle: true,
            elevation: 0,
            scrolledUnderElevation: 0,
            pinned: false,
            floating: true,
            stretch: true,
            snap: false,
            flexibleSpace: FlexibleSpaceBar(
              background: AnimatedListViewIcon(map: map),
              title: FittedBox(
                child: Text(
                  "${map.displayName} ",
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(fontSize: 20.0),
                ),
              ),
              centerTitle: true,
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              childCount: 20,
              (context, index) => ListTile(
                title: Text(
                  index.toString(),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class AnimatedListViewIcon extends StatelessWidget {
  const AnimatedListViewIcon({
    super.key,
    required this.map,
  });

  final GameMap map;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: map.listViewIcon ?? "",
      flightShuttleBuilder: (flightContext, animation, flightDirection,
          fromHeroContext, toHeroContext) {
        Animation<double> borderAnimation =
            Tween<double>(begin: 12, end: 0).animate(animation);

        return AnimatedBuilder(
          animation: borderAnimation,
          builder: (context, child) {
            return Material(
              surfaceTintColor: Colors.transparent,
              color: Colors.transparent,
              child: ClipRRect(
                borderRadius:
                    BorderRadius.all(Radius.circular(borderAnimation.value)),
                child: CachedNetworkImage(
                  imageUrl: map.listViewIcon ?? "",
                  width: double.infinity,
                  filterQuality: FilterQuality.low,
                  height: 100,
                  fit: BoxFit.cover,
                ),
              ),
            );
          },
        );
      },
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(0)),
        child: CachedNetworkImage(
          imageUrl: map.listViewIcon ?? "",
          width: double.infinity,
          filterQuality: FilterQuality.low,
          height: 100,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
