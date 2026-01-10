import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../features/auth/presentation/screens/login_screen.dart';
import '../../features/game/presentation/screens/game_screen.dart';
import '../../features/home/presentation/screens/home_screen.dart';
import '../../features/library/presentation/screens/library_screen.dart';
import '../../features/library/presentation/screens/story_detail_screen.dart';
import '../../features/profile/presentation/screens/profile_screen.dart';
import '../../features/reader/presentation/screens/reader_screen.dart';
import '../../features/statistics/presentation/screens/statistics_screen.dart';
import '../../features/vocabulary/presentation/screens/vocabulary_screen.dart';
import '../../features/vocabulary/presentation/screens/album_detail_screen.dart';
import '../../features/vocabulary/presentation/screens/fullscreen_player_screen.dart';
import '../../shared/widgets/main_shell.dart';
import '../auth/auth_provider.dart';
import 'route_names.dart';

part 'app_router.g.dart';

// Navigation key for root navigator
final _rootNavigatorKey = GlobalKey<NavigatorState>();

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
          // Vocabulary branch (index 2)
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: RouteNames.vocabulary,
                name: 'vocabulary',
                builder: (context, state) => const VocabularyScreen(),
              ),
            ],
          ),
          // Statistics branch (index 3)
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: RouteNames.statistics,
                name: 'statistics',
                builder: (context, state) => const StatisticsScreen(),
              ),
            ],
          ),
          // Profile branch (index 4)
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
      // Story detail route (outside shell - no bottom nav)
      GoRoute(
        path: '/story/:slug',
        name: 'storyDetail',
        parentNavigatorKey: _rootNavigatorKey,
        builder: (context, state) {
          final slug = state.pathParameters['slug']!;
          return StoryDetailScreen(slug: slug);
        },
      ),
      // Story reader route (outside shell - no bottom nav)
      GoRoute(
        path: '${RouteNames.reader}/:slug',
        name: 'reader',
        parentNavigatorKey: _rootNavigatorKey,
        builder: (context, state) {
          final slug = state.pathParameters['slug']!;
          final episode =
              int.tryParse(state.uri.queryParameters['ep'] ?? '1') ?? 1;
          return ReaderScreen(slug: slug, initialEpisode: episode);
        },
      ),
      // Game route (outside shell - no bottom nav)
      GoRoute(
        path: '${RouteNames.game}/:slug/:episode',
        name: 'game',
        parentNavigatorKey: _rootNavigatorKey,
        builder: (context, state) {
          final slug = state.pathParameters['slug']!;
          final episode = int.tryParse(state.pathParameters['episode'] ?? '1') ?? 1;
          return GameScreen(storySlug: slug, episodeNumber: episode);
        },
      ),
      // Album detail route (outside shell - no bottom nav)
      GoRoute(
        path: '/vocabulary/album/:albumId',
        name: 'albumDetail',
        parentNavigatorKey: _rootNavigatorKey,
        builder: (context, state) {
          final albumId = state.pathParameters['albumId']!;
          return AlbumDetailScreen(albumId: albumId);
        },
      ),
      // Album practice route (fullscreen player)
      GoRoute(
        path: '/vocabulary/album/:albumId/practice',
        name: 'albumPractice',
        parentNavigatorKey: _rootNavigatorKey,
        builder: (context, state) {
          final albumId = state.pathParameters['albumId']!;
          final albumName = state.uri.queryParameters['name'] ?? 'Practice';
          final wordIdsParam = state.uri.queryParameters['words'] ?? '';
          final wordIds = wordIdsParam.isNotEmpty
              ? wordIdsParam.split(',')
              : <String>[];
          return FullscreenPlayerScreen(
            albumId: albumId,
            albumName: albumName,
            wordIds: wordIds,
          );
        },
      ),
      // Word detail route (outside shell)
      GoRoute(
        path: '/vocabulary/word/:wordId',
        name: 'wordDetail',
        parentNavigatorKey: _rootNavigatorKey,
        builder: (context, state) {
          // TODO: Create word detail screen
          return Scaffold(
            appBar: AppBar(title: Text(state.pathParameters['wordId'] ?? '')),
            body: const Center(child: Text('Word detail coming soon')),
          );
        },
      ),
      // Level detail route (outside shell)
      GoRoute(
        path: '/vocabulary/level/:level',
        name: 'levelDetail',
        parentNavigatorKey: _rootNavigatorKey,
        builder: (context, state) {
          // TODO: Create level detail screen
          return Scaffold(
            appBar: AppBar(title: Text('${state.pathParameters['level']} Words')),
            body: const Center(child: Text('Level detail coming soon')),
          );
        },
      ),
    ],
    errorBuilder: (context, state) => Scaffold(
      body: Center(
        child: Text('Page not found: ${state.uri}'),
      ),
    ),
  );
}
