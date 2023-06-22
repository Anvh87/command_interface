import 'package:command_interface/pages/dashboard/dashboard_page.dart';
import 'package:command_interface/pages/pumps/pumps_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:command_interface/Pages/home/home_page.dart';
import 'package:command_interface/Pages/sp_2000/sp_2000_page.dart';

// private navigators
final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorHomeKey = GlobalKey<NavigatorState>(debugLabel: 'shellHome');
final _shellNavigatorSp2000Key = GlobalKey<NavigatorState>(debugLabel: 'shellSp2000');
final _shellNavigatorPumpsKey = GlobalKey<NavigatorState>(debugLabel: 'shellPumps');

// the one and only GoRouter instance
final goRouter = GoRouter(
  initialLocation: '/',
  navigatorKey: _rootNavigatorKey,
  routes: [
    // Stateful nested navigation based on:
    // https://github.com/flutter/packages/blob/main/packages/go_router/example/lib/stateful_shell_route.dart
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        // the UI shell
        return DashboardPage(
            navigationShell: navigationShell);
      },
      branches: [
        // first branch (A)
        StatefulShellBranch(
          navigatorKey: _shellNavigatorHomeKey,
          routes: [
            // top route inside branch
            GoRoute(
              path: '/',
              pageBuilder: (context, state) => const NoTransitionPage(
                child: HomePage(),
              ),
            ),
          ],
        ),
        // second branch (B)
        StatefulShellBranch(
          navigatorKey: _shellNavigatorSp2000Key,
          routes: [
            // top route inside branch
            GoRoute(
              path: '/sp2000',
              pageBuilder: (context, state) => const NoTransitionPage(
                child: Sp2000Page(),
              ),
            ),
          ],
        ),
                StatefulShellBranch(
          navigatorKey: _shellNavigatorPumpsKey,
          routes: [
            // top route inside branch
            GoRoute(
              path: '/pumps',
              pageBuilder: (context, state) => const NoTransitionPage(
                child: PumpsPage(),
              ),
            ),
          ],
        ),
      ],
    ),
  ],
);

// use like this:
// MaterialApp.router(routerConfig: goRouter, ...)