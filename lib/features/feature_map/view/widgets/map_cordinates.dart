import 'package:flutter/material.dart';
import 'package:valorant_intel/config/theme/app_color_scheme.dart';

class MapCordinates extends StatelessWidget {
  const MapCordinates({
    super.key,
    required this.mapCordinates,
  });

  final String? mapCordinates;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          spacing: 20,
          children: [
            Text(
              "Map coridinates:",
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: AppColorScheme.mainRed,
              ),
            ),
            Text(
              mapCordinates ?? "no coridinates",
            ),
          ],
        ),
      ),
    );
  }
}
