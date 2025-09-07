import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:valorant_intel/config/theme/app_color_scheme.dart';
import 'package:valorant_intel/features/feature_weapon/data/models/weapon.dart';

class WeaponCard extends StatelessWidget {
  const WeaponCard({super.key, required this.weapon});
  final Weapon weapon;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
          color: Colors.grey.shade500,
        ),
        padding: EdgeInsets.all(10.0),
        height: 150,
        width: double.infinity,
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: CachedNetworkImage(
                  imageUrl: weapon.displayIcon ?? "",
                  width: 200,
                  placeholder: (context, url) => Shimmer.fromColors(
                    baseColor: AppColorScheme.white,
                    highlightColor: AppColorScheme.grey,
                    child: Container(
                      color: Colors.grey,
                      width: 200,
                    ),
                  ),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
              FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  "${weapon.displayName} ",
                  style: Theme.of(
                    context,
                  ).textTheme.displayLarge?.copyWith(fontSize: 40.0),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
