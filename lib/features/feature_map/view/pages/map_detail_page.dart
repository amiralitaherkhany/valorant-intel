import 'package:flutter/material.dart';
import 'package:valorant_intel/features/feature_map/data/models/game_map.dart';
import 'package:valorant_intel/features/feature_map/view/widgets/map_appbar.dart';
import 'package:valorant_intel/features/feature_map/view/widgets/map_cordinates.dart';
import 'package:valorant_intel/features/feature_map/view/widgets/map_with_callouts.dart';

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
          MapAppBar(
            mapDisplayName: map.displayName,
            mapImageUrl: map.listViewIcon,
          ),
          MapCordinates(
            mapCordinates: map.coordinates,
          ),
          MapWithCallouts(
            mapCallouts: map.callouts,
            mapDisplayIconUrl: map.displayIcon,
            xMultiplier: map.xMultiplier ?? 0.0,
            yMultiplier: map.yMultiplier ?? 0.0,
            xScalarToAdd: map.xScalarToAdd ?? 0.0,
            yScalarToAdd: map.yScalarToAdd ?? 0.0,
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
          ),
        ],
      ),
    );
  }
}
