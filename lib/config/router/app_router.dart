import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:valorant_intel/core/presentation/main_wrapper.dart';
import 'package:valorant_intel/features/feature_agent/bloc/agent_bloc.dart';
import 'package:valorant_intel/features/feature_agent/data/models/agent.dart';
import 'package:valorant_intel/features/feature_agent/view/pages/agent_detail_page.dart';
import 'package:valorant_intel/features/feature_agent/view/pages/agents_page.dart';
import 'package:valorant_intel/features/feature_collections/view/pages/collections_page.dart';
import 'package:valorant_intel/features/feature_game/view/pages/game_page.dart';
import 'package:valorant_intel/features/feature_home/view/pages/home_page.dart';
import 'package:valorant_intel/features/feature_map/bloc/map_bloc.dart';
import 'package:valorant_intel/features/feature_map/data/models/game_map.dart';
import 'package:valorant_intel/features/feature_map/view/pages/map_detail_page.dart';
import 'package:valorant_intel/features/feature_map/view/pages/maps_page.dart';
import 'package:valorant_intel/features/feature_settings/view/pages/settings_page.dart';
import 'package:valorant_intel/features/feature_weapon/bloc/weapon_bloc.dart';
import 'package:valorant_intel/features/feature_weapon/view/pages/weapons_page.dart';
import 'package:valorant_intel/service_locator.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: '/Home',
    routes: [
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return MainWrapper(
            navigationShell: navigationShell,
          );
        },

        branches: [
          _getHomeBranch(),
          _getCollectionsBranch(),
          _getGameBranch(),
          _getSettingsBranch(),
        ],
      ),
    ],
  );

  static StatefulShellBranch _getHomeBranch() {
    return StatefulShellBranch(
      routes: [
        GoRoute(
          path: '/Home',
          pageBuilder: (context, state) {
            return MaterialPage(
              key: state.pageKey,
              child: HomePage(),
            );
          },
        ),
      ],
    );
  }

  static StatefulShellBranch _getCollectionsBranch() {
    return StatefulShellBranch(
      routes: [
        GoRoute(
          path: '/Collections',
          pageBuilder: (context, state) {
            return MaterialPage(
              key: state.pageKey,
              child: const CollectionsPage(),
            );
          },
          routes: [
            GoRoute(
              path: 'Agents',
              pageBuilder: (context, state) => MaterialPage(
                key: state.pageKey,
                child: BlocProvider<AgentBloc>(
                  create: (context) => locator()..add(GetAllAgentsEvent()),
                  child: const AgentsPage(),
                ),
              ),
              routes: [
                GoRoute(
                  path: 'AgentDetail',
                  pageBuilder: (context, state) {
                    return MaterialPage(
                      key: state.pageKey,
                      child: AgentDetailPage(
                        agent: state.extra as Agent,
                      ),
                    );
                  },
                ),
              ],
            ),
            GoRoute(
              path: "Weapons",
              pageBuilder: (context, state) => MaterialPage(
                key: state.pageKey,
                child: BlocProvider<WeaponBloc>(
                  create: (context) => locator()..add(GetAllWeaponsEvent()),
                  child: const WeaponsPage(),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  static StatefulShellBranch _getGameBranch() {
    return StatefulShellBranch(
      routes: [
        GoRoute(
          path: '/Game',
          pageBuilder: (context, state) {
            return MaterialPage(
              key: state.pageKey,
              child: GamePage(),
            );
          },
          routes: [
            GoRoute(
              path: 'Maps',
              pageBuilder: (context, state) {
                return MaterialPage(
                  key: state.pageKey,
                  child: BlocProvider<MapBloc>(
                    create: (context) => locator()..add(GetAllMapsEvent()),
                    child: const MapsPage(),
                  ),
                );
              },
              routes: [
                GoRoute(
                  path: "MapDetail",
                  pageBuilder: (context, state) {
                    return MaterialPage(
                      key: state.pageKey,
                      child: MapDetailPage(
                        map: state.extra as GameMap,
                      ),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }

  static StatefulShellBranch _getSettingsBranch() {
    return StatefulShellBranch(
      routes: [
        GoRoute(
          path: '/Settings',
          pageBuilder: (context, state) {
            return MaterialPage(
              key: state.pageKey,
              child: SettingsPage(),
            );
          },
        ),
      ],
    );
  }
}
