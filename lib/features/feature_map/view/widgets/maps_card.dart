import 'package:flutter/material.dart';
import 'package:valorant_intel/features/feature_map/data/models/game_map.dart';

class MapsCard extends StatelessWidget {
  const MapsCard({super.key, required this.map});
  final GameMap map;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      width: double.infinity,
      height: 200,
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 8,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Theme.of(context).cardColor,
      ),
      child: Center(
        child: Text(
          map.displayName!,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ),
    );
  }
}
