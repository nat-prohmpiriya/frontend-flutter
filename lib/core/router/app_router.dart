import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../features/auth/presentation/screens/login_screen.dart';
import '../../features/home/presentation/screens/home_screen.dart';
import '../../features/library/presentation/screens/library_screen.dart';
import '../../features/profile/presentation/screens/profile_screen.dart';
import '../../shared/widgets/main_shell.dart';
import '../auth/auth_provider.dart';
import 'route_names.dart';

part 'app_router.g.dart';

// Navigation keys for ShellRoute
final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorKey = GlobalKey<NavigatorState>();

@riverpod
GoRouter router(Ref ref) {
  final authState = ref.watch(authStateProvider);

  return GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: RouteNames.home,
    debugLogDiagnostics: true,
    redirect: (context, state) {
      final isLoggedIn = authState.value != null;
      final isLoggingIn = state.matchedLocation == RouteNames.login;

      // If not logged in and not on login page, redirect to login
      if (!isLoggedIn && !isLoggingIn) {
        return RouteNames.login;
      }

      // If logged in and on login page, redirect to home
      if (isLoggedIn && isLoggingIn) {
        return RouteNames.home;
      }

      return null;
    },
    routes: [
      // Login route (outside shell - no bottom nav)
      GoRoute(
        path: RouteNames.login,
        name: 'login',
        builder: (context, state) => const LoginScreen(),
      ),
      // Main shell with bottom navigation
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return MainShell(navigationShell: navigationShell);
        },
        branches: [
          // Home branch (index 0)
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: RouteNames.home,
                name: 'home',
                builder: (context, state) => const HomeScreen(),
              ),
            ],
          ),
          // Library branch (index 1)
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: RouteNames.library,
                name: 'library',
                builder: (context, state) => const LibraryScreen(),
              ),
            ],
          ),
          // Profile branch (index 2)
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: RouteNames.profile,
                name: 'profile',
                builder: (context, state) => const ProfileScreen(),
              ),
            ],
          ),
        ],
      ),
      // Reader route (outside shell - no bottom nav)
      // GoRoute(
      //   path: '${RouteNames.reader}/:slug',
      //   name: 'reader',
      //   parentNavigatorKey: _rootNavigatorKey,
      //   builder: (context, state) {
      //     final slug = state.pathParameters['slug']!;
      //     return ReaderScreen(slug: slug);
      //   },
      // ),
    ],
    errorBuilder: (context, state) => Scaffold(
      body: Center(
        child: Text('Page not found: ${state.uri}'),
      ),
    ),
  );
}
