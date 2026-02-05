import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pi_hole_client/base.dart';
import 'package:pi_hole_client/routing/routes.dart';

/// Creates the application router configuration.
///
/// The router is created as a function that takes the navigator key
/// to maintain compatibility with existing navigation observers (e.g., Sentry).
///
/// ## Migration Strategy
///
/// This is the foundation setup for go_router (Phase 1.2).
/// Currently, the router wraps the existing [Base] widget which handles
/// internal tab-based navigation. In Phase 3, individual screens will be
/// migrated to use go_router directly.
///
/// The [navigatorKey] parameter allows external observers like
/// [SentryNavigatorObserver] to track navigation events.
GoRouter createAppRouter({
  required GlobalKey<NavigatorState> navigatorKey,
  List<NavigatorObserver>? observers,
}) {
  return GoRouter(
    navigatorKey: navigatorKey,
    initialLocation: '/',
    observers: observers ?? [],
    routes: [
      // Main shell route - wraps the Base widget which handles
      // bottom navigation and internal tab switching.
      // In Phase 3, this will be refactored to use ShellRoute
      // with individual GoRoute children for each tab.
      GoRoute(
        path: '/',
        name: Routes.home,
        builder: (context, state) => const Base(),
      ),
    ],
  );
}
