import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:valorant_intel/config/theme/app_color_scheme.dart';
import 'package:valorant_intel/features/feature_agent/data/models/ability.dart';

class AgentAbilityItem extends StatelessWidget {
  const AgentAbilityItem({super.key, required this.ability});

  final Ability ability;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showModalBottomSheet(
          context: context,
          builder: (context) =>
              AgentAbilityBottomSheetContent(ability: ability),
        );
      },
      child: SizedBox(
        height: 100,
        child: Card(
          margin: const EdgeInsets.symmetric(horizontal: 10),
          shadowColor: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                if (ability.displayIcon != "") ...{
                  CachedNetworkImage(
                    imageUrl: ability.displayIcon,
                    height: 50,
                    placeholder: (context, url) {
                      return Shimmer.fromColors(
                        baseColor: AppColorScheme.grey,
                        highlightColor: AppColorScheme.white,
                        child: Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.white,
                          ),
                        ),
                      );
                    },
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),
                } else ...{
                  const Expanded(
                    child: Center(
                      child: Icon(
                        Icons.image_not_supported,
                        color: Colors.white,
                        size: 45,
                      ),
                    ),
                  ),
                },
                const Spacer(),
                Text(
                  ability.displayName,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(
                    context,
                  ).textTheme.bodyMedium?.copyWith(fontSize: 11),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class AgentAbilityBottomSheetContent extends StatelessWidget {
  const AgentAbilityBottomSheetContent({super.key, required this.ability});

  final Ability ability;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (ability.displayIcon != "") ...{
            CachedNetworkImage(
              imageUrl: ability.displayIcon,
              height: 80,
              width: 80,
            ),
          } else ...{
            const Icon(
              Icons.image_not_supported,
              color: Colors.white,
              size: 75,
            ),
          },
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              ability.displayName,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                fontSize: 20,
                color: AppColorScheme.mainRed,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Text(ability.description),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
