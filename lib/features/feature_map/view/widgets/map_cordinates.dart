import 'package:flutter/material.dart';
import 'package:valorant_intel/config/theme/app_color_scheme.dart';
import 'package:valorant_intel/core/extensions/context_extensions.dart';

class MapCordinates extends StatelessWidget {
  const MapCordinates({
    super.key,
    required this.mapCordinates,
  });

  final String? mapCordinates;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: RichText(
        text: TextSpan(
          text: "Map coridinates: ",
          style:
              Theme.of(
                context,
              ).textTheme.bodyMedium?.copyWith(
                color: AppColorScheme.mainRed,
              ),
          children: [
            TextSpan(
              text: mapCordinates ?? context.localizations.none,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
        textAlign: TextAlign.left,
      ),
    );
  }
}
