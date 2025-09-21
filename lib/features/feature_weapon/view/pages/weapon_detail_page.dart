import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:valorant_intel/config/theme/app_color_scheme.dart';
import 'package:valorant_intel/features/feature_weapon/data/models/weapon.dart';
import 'package:valorant_intel/features/feature_weapon/view/widgets/weapon_app_bar.dart';
import 'package:valorant_intel/features/feature_weapon/view/widgets/weapon_skin_viewer.dart';

class WeaponDetailPage extends StatelessWidget {
  const WeaponDetailPage({super.key, required this.weapon});
  final Weapon weapon;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          WeaponAppBar(
            imageUrl: weapon.displayIcon ?? "",
            title: weapon.displayName ?? "",
          ),
          SliverPadding(
            padding: EdgeInsetsGeometry.all(10),
            sliver: SliverToBoxAdapter(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Center(
                      child: Text(
                        weapon.getCategory,
                        style: Theme.of(context).textTheme.displayLarge
                            ?.copyWith(
                              color: Theme.of(context).colorScheme.primary,
                            ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5.0),
                      child: CachedNetworkImage(
                        imageUrl: weapon.killStreamIcon ?? "",
                        color: Theme.of(context).colorScheme.onSurface,
                        height: 100,
                        placeholder: (context, url) {
                          return Shimmer.fromColors(
                            baseColor: AppColorScheme.grey,
                            highlightColor: AppColorScheme.white,
                            child: Container(
                              height: 100,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                          );
                        },
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SliverToBoxAdapter(
            child: Divider(indent: 20, endIndent: 20),
          ),
          SliverPadding(
            padding: EdgeInsetsGeometry.symmetric(horizontal: 10),
            sliver: WeaponSkinViewer(weapon: weapon),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              childCount: 50,
              (context, index) => Text("1"),
            ),
          ),
        ],
      ),
    );
  }
}
