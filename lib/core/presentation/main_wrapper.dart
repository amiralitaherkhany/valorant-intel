import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:valorant_intel/core/extensions/context_extensions.dart';

class MainWrapper extends StatelessWidget {
  final StatefulNavigationShell navigationShell;

  const MainWrapper({super.key, required this.navigationShell});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 0,
        scrolledUnderElevation: 0,
      ),
      body: navigationShell,
      bottomNavigationBar: BottomNavigationBar(
        elevation: 5,
        selectedFontSize: 10,
        unselectedFontSize: 9,
        type: BottomNavigationBarType.fixed,
        enableFeedback: true,
        currentIndex: navigationShell.currentIndex,
        onTap: (index) {
          navigationShell.goBranch(
            index,
            initialLocation: index == navigationShell.currentIndex,
          );
        },
        items: [
          BottomNavigationBarItem(
            icon: const Icon(Icons.home),
            label: context.localizations.home,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.collections),
            label: context.localizations.collections,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.gamepad),
            label: context.localizations.game,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.person),
            label: context.localizations.profile,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.settings),
            label: context.localizations.settings,
          ),
        ],
      ),
    );
  }
}
