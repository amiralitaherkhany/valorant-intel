import 'dart:ui';

import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    super.key,
    required this.onTap,
    required this.image,
    required this.title,
  });
  final void Function() onTap;
  final Image image;
  final String title;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        clipBehavior: Clip.hardEdge,
        padding: const EdgeInsets.all(0),
        width: double.infinity,
        margin: const EdgeInsets.all(20),
        decoration: ShapeDecoration(
          shape: RoundedSuperellipseBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(45),
            ),
            side: BorderSide(
              color: Theme.of(context).colorScheme.primary,
              width: 2,
            ),
          ),
          color: Theme.of(context).colorScheme.surface,
        ),
        child: Stack(
          fit: StackFit.expand,
          children: [
            ClipRSuperellipse(
              borderRadius: BorderRadius.all(
                Radius.circular(45),
              ),
              child: ImageFiltered(
                imageFilter: ImageFilter.blur(
                  sigmaX: 2,
                  sigmaY: 2,
                ),
                child: image,
              ),
            ),
            Center(
              child: Text(
                title,
                style: Theme.of(context).textTheme.displayMedium?.copyWith(
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
