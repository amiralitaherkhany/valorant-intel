import 'package:flutter/material.dart';
import 'package:valorant_intel/features/feature_map/data/models/game_map.dart';
import 'package:valorant_intel/features/feature_map/view/widgets/map_app_bar.dart';
import 'package:valorant_intel/features/feature_map/view/widgets/map_cordinates.dart';
import 'package:valorant_intel/features/feature_map/view/widgets/map_display_icon.dart';

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
          MapDisplayIcon(
            mapDisplayIconUrl: map.displayIcon,
          ),
        ],
      ),
    );
  }
}
