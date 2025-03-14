import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:valorant_intel/core/extensions/context_extensions.dart';
import 'package:valorant_intel/core/widgets/category_card.dart';

class CollectionsPage extends StatelessWidget {
  const CollectionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.localizations.collections),
        centerTitle: true,
        titleTextStyle: Theme.of(context).textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
              fontSize: 30,
            ),
        elevation: 0,
        scrolledUnderElevation: 0,
      ),
      body: CustomScrollView(
        slivers: [
          SliverList(
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
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
