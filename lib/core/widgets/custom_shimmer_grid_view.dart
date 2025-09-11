import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:valorant_intel/config/theme/app_color_scheme.dart';
import 'package:valorant_intel/core/extensions/context_extensions.dart';

class CustomShimmerGridView extends StatelessWidget {
  const CustomShimmerGridView({
    super.key,
    required this.width,
    required this.height,
    required this.radius,
  });
  final int width;
  final int height;
  final double radius;
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverPadding(
          padding: EdgeInsets.symmetric(
            horizontal: context.width / 35,
            vertical: 30,
          ),
          sliver: SliverToBoxAdapter(
            child: GridView.builder(
              addRepaintBoundaries: true,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 10,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: context.width > width
                    ? context.width ~/ width
                    : 1,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                mainAxisExtent: height.toDouble(),
              ),
              itemBuilder: (context, index) => Shimmer.fromColors(
                baseColor: AppColorScheme.grey,
                highlightColor: AppColorScheme.white,
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(radius),
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
