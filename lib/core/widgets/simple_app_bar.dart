import 'package:flutter/material.dart';

class SimpleAppBar extends StatelessWidget implements PreferredSizeWidget {
  const SimpleAppBar({
    super.key,
    required this.title,
  });
  final Widget title;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: title,
      centerTitle: true,
      titleTextStyle: Theme.of(context).textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.bold,
            fontSize: 30,
          ),
      elevation: 0,
      scrolledUnderElevation: 0,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56);
}
