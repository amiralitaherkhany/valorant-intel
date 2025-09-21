import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:valorant_intel/config/theme/app_color_scheme.dart';
import 'package:valorant_intel/features/feature_weapon/data/models/skin.dart';
import 'package:valorant_intel/features/feature_weapon/data/models/weapon.dart';

class WeaponSkinViewer extends StatefulWidget {
  const WeaponSkinViewer({
    super.key,
    required this.weapon,
  });

  final Weapon weapon;

  @override
  State<WeaponSkinViewer> createState() => _WeaponSkinViewerState();
}

class _WeaponSkinViewerState extends State<WeaponSkinViewer> {
  late final ValueNotifier<Skin> selectedSkin;
  @override
  void initState() {
    super.initState();
    selectedSkin = ValueNotifier<Skin>(widget.weapon.skins!.first);
  }

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ListenableBuilder(
            listenable: selectedSkin,
            builder: (context, child) => CachedNetworkImage(
              imageUrl: selectedSkin.value.displayIcon ?? "",
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
          ),
          SizedBox(
            height: 10,
          ),
          SizedBox(
            height: 150,
            child: CarouselView(
              enableSplash: true,
              itemSnapping: true,
              shrinkExtent: 120,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              elevation: 5,
              itemExtent: 200,
              padding: EdgeInsets.all(10),
              onTap: (index) {
                selectedSkin.value = widget.weapon.skins![index];
              },
              children: List.generate(
                widget.weapon.skins?.length ?? 0,
                (index) {
                  return ListenableBuilder(
                    listenable: selectedSkin,
                    builder: (context, child) {
                      return Container(
                        width: double.infinity,
                        height: double.infinity,
                        color: selectedSkin.value == widget.weapon.skins?[index]
                            ? AppColorScheme.grey
                            : AppColorScheme.white,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 6,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                flex: 2,
                                child: Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: CachedNetworkImage(
                                    imageUrl:
                                        widget
                                            .weapon
                                            .skins?[index]
                                            .displayIcon ??
                                        "",
                                    placeholder: (context, url) {
                                      return Shimmer.fromColors(
                                        baseColor: AppColorScheme.grey,
                                        highlightColor: AppColorScheme.white,
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.circular(
                                              5,
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                    errorWidget: (context, url, error) =>
                                        const Icon(
                                          Icons.image_not_supported,
                                          size: 50,
                                          color: Colors.black,
                                        ),
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: FittedBox(
                                  fit: BoxFit.scaleDown,
                                  child: Text(
                                    widget.weapon.skins?[index].displayName ??
                                        "",
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
                      );
                    },
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}



// SizedBox(
//             height: 140,
//             child: ListView.builder(
//               scrollDirection: Axis.horizontal,
//               itemCount: weapon.skins?.length,
//               itemBuilder: (context, index) {
//                 return Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Container(
//                     width: 250,
//                     decoration: BoxDecoration(
//                       color: AppColorScheme.white,
//                       borderRadius: BorderRadius.circular(7),
//                     ),
//                     child: Padding(
//                       padding: const EdgeInsets.symmetric(
//                         horizontal: 5,
//                         vertical: 3,
//                       ),
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Expanded(
//                             flex: 2,
//                             child: CachedNetworkImage(
//                               imageUrl: weapon.skins?[index].displayIcon ?? "",
//                               placeholder: (context, url) {
//                                 return Shimmer.fromColors(
//                                   baseColor: AppColorScheme.grey,
//                                   highlightColor: AppColorScheme.white,
//                                   child: Container(
//                                     decoration: BoxDecoration(
//                                       color: Colors.white,
//                                       borderRadius: BorderRadius.circular(5),
//                                     ),
//                                   ),
//                                 );
//                               },
//                               errorWidget: (context, url, error) => const Icon(
//                                 Icons.image_not_supported,
//                                 size: 50,
//                                 color: Colors.black,
//                               ),
//                             ),
//                           ),
//                           Expanded(
//                             flex: 1,
//                             child: FittedBox(
//                               fit: BoxFit.scaleDown,
//                               child: Text(
//                                 weapon.skins?[index].displayName ?? "",
//                                 textAlign: TextAlign.center,
//                                 style:
//                                     Theme.of(
//                                       context,
//                                     ).textTheme.displayLarge?.copyWith(
//                                       fontSize: 27,
//                                       color: Colors.black,
//                                     ),
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 );
//               },
//             ),
//           ),