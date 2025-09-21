import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class WeaponAppBar extends StatelessWidget {
  const WeaponAppBar({
    super.key,
    required this.title,
    required this.imageUrl,
  });

  final String title;
  final String imageUrl;
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      flexibleSpace: FlexibleSpaceBar(
        titlePadding: EdgeInsets.all(6),
        title: FittedBox(
          fit: BoxFit.scaleDown,
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.displayLarge?.copyWith(
              fontSize: 35,
              color: Theme.of(context).colorScheme.onSurface,
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
              imageUrl: imageUrl,
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
