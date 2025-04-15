import 'package:flutter/material.dart';
import 'package:valorant_intel/core/widgets/simple_app_bar.dart';
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
      appBar: SimpleAppBar(title: Text(map.displayName ?? "")),
      body: Center(
        child: Text(map.displayName ?? ""),
      ),
    );
  }
}
