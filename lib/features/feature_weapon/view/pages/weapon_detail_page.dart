import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:valorant_intel/config/theme/app_color_scheme.dart';
import 'package:valorant_intel/features/feature_weapon/data/models/weapon.dart';

class WeaponDetailPage extends StatelessWidget {
  const WeaponDetailPage({super.key, required this.weapon});
  final Weapon weapon;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          WeaponAppBar(weapon: weapon),
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

class WeaponAppBar extends StatelessWidget {
  const WeaponAppBar({
    super.key,
    required this.weapon,
  });

  final Weapon weapon;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      flexibleSpace: FlexibleSpaceBar(
        titlePadding: EdgeInsets.all(6),
        title: FittedBox(
          fit: BoxFit.scaleDown,
          child: Text(
            weapon.displayName ?? "",
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.displayLarge?.copyWith(
              fontSize: 35,
            ),
          ),
        ),
        background: Container(
          padding: EdgeInsets.only(
            top: MediaQuery.viewPaddingOf(context).top,
            bottom: 30,
          ),
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFF3E5151),
                Color(0xFFDECBA4),
              ],
              begin: AlignmentDirectional.topStart,
              end: AlignmentDirectional.bottomEnd,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(30),
            child: CachedNetworkImage(
              imageUrl: weapon.displayIcon ?? "",
              fit: BoxFit.contain,
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
          ),
        ),
        centerTitle: true,
      ),
      elevation: 0,
      scrolledUnderElevation: 0,
      pinned: true,
      floating: false,
      snap: false,
      stretch: true,
      expandedHeight: 200,
    );
  }
}
