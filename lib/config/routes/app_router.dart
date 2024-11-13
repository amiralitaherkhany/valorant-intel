import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:valorant_intel/core/presentation/main_wrapper.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: '/home',
    routes: [
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) => MainWrapper(
          navigationShell: navigationShell,
        ),
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/home',
                pageBuilder: (context, state) =>
                    const MaterialPage(child: HomePage()),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/search',
                pageBuilder: (context, state) =>
                    const MaterialPage(child: SearchPage()),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/profile',
                pageBuilder: (context, state) =>
                    const MaterialPage(child: ProfilePage()),
              ),
            ],
          )
        ],
      ),
    ],
  );
}
