import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:valorant_intel/core/extensions/context_extensions.dart';
import 'package:valorant_intel/core/widgets/category_card.dart';
import 'package:valorant_intel/core/widgets/simple_app_bar.dart';

class CollectionsPage extends StatelessWidget {
  const CollectionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SimpleAppBar(
        title: Text(context.localizations.collections),
      ),
      body: CustomScrollView(
        slivers: [
          SliverGrid(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: context.width > 300 ? context.width ~/ 300 : 1,
              mainAxisSpacing: 16,
              crossAxisSpacing: 16,
              mainAxisExtent: 250,
            ),
            delegate: SliverChildListDelegate.fixed(
              [
                CategoryCard(
                  onTap: () => context.go('/Collections/Agents'),
                  image: Image.asset(
                    'assets/images/agents.jpg',
                    fit: BoxFit.cover,
                    filterQuality: FilterQuality.low,
                  ),
                  title: context.localizations.agents,
                ),
                CategoryCard(
                  onTap: () => context.go('/Collections/Weapons'),
                  image: Image.asset(
                    'assets/images/weapons.jpg',
                    fit: BoxFit.cover,
                    filterQuality: FilterQuality.low,
                  ),
                  title: context.localizations.weapons,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
