import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../features/auth/presentation/screens/login_screen.dart';
import '../../features/home/presentation/screens/home_screen.dart';
import '../auth/auth_provider.dart';
import 'route_names.dart';

part 'app_router.g.dart';

@riverpod
GoRouter router(Ref ref) {
  final authState = ref.watch(authStateProvider);

  return GoRouter(
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
      GoRoute(
        path: RouteNames.login,
        name: 'login',
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: RouteNames.home,
        name: 'home',
        builder: (context, state) => const HomeScreen(),
      ),
      // TODO: Add more routes as screens are implemented
      // GoRoute(
      //   path: RouteNames.library,
      //   name: 'library',
      //   builder: (context, state) => const LibraryScreen(),
      // ),
      // GoRoute(
      //   path: '${RouteNames.reader}/:slug',
      //   name: 'reader',
      //   builder: (context, state) {
      //     final slug = state.pathParameters['slug']!;
      //     return ReaderScreen(slug: slug);
      //   },
      // ),
      // GoRoute(
      //   path: RouteNames.profile,
      //   name: 'profile',
      //   builder: (context, state) => const ProfileScreen(),
      // ),
      // GoRoute(
      //   path: RouteNames.statistics,
      //   name: 'statistics',
      //   builder: (context, state) => const StatisticsScreen(),
      // ),
    ],
    errorBuilder: (context, state) => Scaffold(
      body: Center(
        child: Text('Page not found: ${state.uri}'),
      ),
    ),
  );
}
