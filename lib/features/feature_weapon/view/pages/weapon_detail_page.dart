import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:valorant_intel/config/theme/app_color_scheme.dart';
import 'package:valorant_intel/features/feature_weapon/data/models/weapon.dart';
import 'package:valorant_intel/features/feature_weapon/view/widgets/weapon_app_bar.dart';

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
                        style: Theme.of(context).textTheme.displayLarge,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5.0),
                      child: CachedNetworkImage(
                        imageUrl: weapon.killStreamIcon ?? "",
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
          WeaponSkinViewer(weapon: weapon),
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

class WeaponSkinViewer extends StatelessWidget {
  const WeaponSkinViewer({
    super.key,
    required this.weapon,
  });

  final Weapon weapon;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          CachedNetworkImage(
            imageUrl: weapon.skins?.first.displayIcon ?? "",
            height: 200,
            placeholder: (context, url) {
              return Shimmer.fromColors(
                baseColor: AppColorScheme.grey,
                highlightColor: AppColorScheme.white,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              );
            },
            errorWidget: (context, url, error) => const Icon(
              Icons.image_not_supported,
              size: 50,
              color: Colors.black,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          SizedBox(
            height: 140,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: weapon.skins?.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: 250,
                    decoration: BoxDecoration(
                      color: AppColorScheme.white,
                      borderRadius: BorderRadius.circular(7),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 5,
                        vertical: 3,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            flex: 2,
                            child: CachedNetworkImage(
                              imageUrl: weapon.skins?[index].displayIcon ?? "",
                              placeholder: (context, url) {
                                return Shimmer.fromColors(
                                  baseColor: AppColorScheme.grey,
                                  highlightColor: AppColorScheme.white,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                  ),
                                );
                              },
                              errorWidget: (context, url, error) => const Icon(
                                Icons.image_not_supported,
                                size: 50,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: FittedBox(
                              fit: BoxFit.scaleDown,
                              child: Text(
                                weapon.skins?[index].displayName ?? "",
                                textAlign: TextAlign.center,
                                style:
                                    Theme.of(
                                      context,
                                    ).textTheme.displayLarge?.copyWith(
                                      fontSize: 27,
                                      color: Colors.black,
                                    ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
