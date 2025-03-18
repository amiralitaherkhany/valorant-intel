import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:valorant_intel/core/extensions/context_extensions.dart';
import 'package:valorant_intel/core/widgets/category_card.dart';
import 'package:valorant_intel/core/widgets/simple_app_bar.dart';

class GamePage extends StatelessWidget {
  const GamePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SimpleAppBar(
        title: Text(context.localizations.game),
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
                  title: context.localizations.maps,
                  image: Image.asset(
                    'assets/images/maps.jpg',
                    fit: BoxFit.cover,
                  ),
                  onTap: () {
                    context.go("/Game/Maps");
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
