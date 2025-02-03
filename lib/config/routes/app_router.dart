import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:valorant_intel/core/presentation/main_wrapper.dart';
import 'package:valorant_intel/features/feature_agent/blocs/agent_bloc.dart';
import 'package:valorant_intel/features/feature_agent/data/models/agent/agent.dart';
import 'package:valorant_intel/features/feature_agent/view/pages/agent_detail_page.dart';
import 'package:valorant_intel/features/feature_agent/view/pages/agent_page.dart';
import 'package:valorant_intel/features/feature_settings/view/pages/settings_page.dart';
import 'package:valorant_intel/service_locator.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: '/Home',
    routes: [
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) => MainWrapper(
          navigationShell: navigationShell,
        ),
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/Home',
                pageBuilder: (context, state) => MaterialPage(
                  maintainState: true,
                  child: BlocProvider<AgentBloc>(
                    create: (context) => locator()..add(GetAllAgentsEvent()),
                    child: const AgentsPage(),
                  ),
                ),
                routes: [
                  GoRoute(
                    path: 'AgentDetail',
                    pageBuilder: (context, state) {
                      return CustomTransitionPage(
                        transitionDuration: const Duration(milliseconds: 800),
                        reverseTransitionDuration:
                            const Duration(milliseconds: 800),
                        transitionsBuilder:
                            (context, animation, secondaryAnimation, child) {
                          return FadeTransition(
                            opacity: animation,
                            child: child,
                          );
                        },
                        child: AgentDetailPage(
                          agent: state.extra as Agent,
                        ),
                        maintainState: true,
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/Collections',
                pageBuilder: (context, state) => const MaterialPage(
                  child: Center(child: Text('Collections Page')),
                ),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/Game',
                pageBuilder: (context, state) => const MaterialPage(
                  child: Center(child: Text('Game Page')),
                ),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/Profile',
                pageBuilder: (context, state) => const MaterialPage(
                  child: Center(child: Text('Profile Page')),
                ),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/Settings',
                pageBuilder: (context, state) => const MaterialPage(
                  child: SettingsPage(),
                ),
              ),
            ],
          )
        ],
      ),
    ],
  );
}
