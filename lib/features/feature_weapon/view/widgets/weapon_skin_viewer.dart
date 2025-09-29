import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:valorant_intel/config/theme/app_color_scheme.dart';
import 'package:valorant_intel/features/feature_weapon/data/models/chroma.dart';
import 'package:valorant_intel/features/feature_weapon/data/models/skin.dart';

class WeaponSkinViewer extends StatefulWidget {
  const WeaponSkinViewer({
    super.key,
    required this.skinList,
  });

  final List<Skin> skinList;

  @override
  State<WeaponSkinViewer> createState() => _WeaponSkinViewerState();
}

class _WeaponSkinViewerState extends State<WeaponSkinViewer> {
  late final ValueNotifier<Skin> selectedSkin;
  late final ValueNotifier<String> selectedImageUrl;
  @override
  void initState() {
    super.initState();
    selectedSkin = ValueNotifier<Skin>(widget.skinList[0]);
    selectedImageUrl = ValueNotifier<String>(
      selectedSkin.value.displayIcon ?? "",
    );
  }

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildListDelegate([
        ListenableBuilder(
          listenable: selectedImageUrl,
          builder: (context, child) =>
              SelectedSkinImage(imageUrl: selectedImageUrl.value),
        ),
        ListenableBuilder(
          listenable: selectedSkin,
          builder: (context, child) {
            return SkinChromasViewer(
              chromas: selectedSkin.value.chromas ?? [],
              onTap: (chroma) {
                selectedImageUrl.value = chroma.fullRender ?? "";
              },
            );
          },
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
              selectedSkin.value = widget.skinList[index];
              selectedImageUrl.value = widget.skinList[index].displayIcon ?? "";
            },
            children: List.generate(
              widget.skinList.length,
              (index) {
                return ListenableBuilder(
                  listenable: selectedSkin,
                  builder: (context, child) {
                    return Container(
                      width: double.infinity,
                      height: double.infinity,
                      color: selectedSkin.value == widget.skinList[index]
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
                                      widget.skinList[index].displayIcon ?? "",
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
                                  widget.skinList[index].displayName ?? "",
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
      ]),
    );
  }
}

class SkinChromasViewer extends StatelessWidget {
  const SkinChromasViewer({
    super.key,
    required this.chromas,
    required this.onTap,
  });

  final List<Chroma> chromas;
  final Function(Chroma) onTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      color: Colors.grey,
      padding: EdgeInsets.all(5),
      child: ListView.separated(
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              onTap(chromas[index]);
            },
            child: Row(
              children: [
                CachedNetworkImage(
                  imageUrl: chromas[index].swatch ?? "",
                  height: 50,
                  width: 50,
                  placeholder: (context, url) {
                    return Shimmer.fromColors(
                      baseColor: AppColorScheme.grey,
                      highlightColor: AppColorScheme.white,
                      child: Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(1),
                        ),
                      ),
                    );
                  },
                  errorWidget: (context, url, error) => const Icon(
                    Icons.image_not_supported,
                    size: 20,
                    color: Colors.black,
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
                Expanded(
                  child: FittedBox(
                    alignment: AlignmentGeometry.centerLeft,
                    fit: BoxFit.scaleDown,
                    child: Text(
                      textAlign: TextAlign.left,
                      chromas[index].displayName ?? "",
                      style: Theme.of(context).textTheme.displayLarge?.copyWith(
                        fontSize: 30,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
        separatorBuilder: (context, index) => Padding(
          padding: const EdgeInsets.all(4.0),
          child: Divider(),
        ),
        itemCount: chromas.length,
      ),
    );
  }
}

class SelectedSkinImage extends StatelessWidget {
  const SelectedSkinImage({
    super.key,
    required this.imageUrl,
  });

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
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
    );
  }
}
