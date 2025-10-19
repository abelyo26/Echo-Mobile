import 'package:echo/screens/clipboard_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../screens/connect_screen.dart';
import '../screens/files_screen.dart';
import '../screens/notifications_screen.dart';
import '../screens/settings_screen.dart';
import '../screens/home_screen.dart';
import 'app_scaffold.dart';

class AppRouter {
  static final _rootNavigatorKey = GlobalKey<NavigatorState>();
  static final _shellNavigatorKey = GlobalKey<NavigatorState>();

  static final GoRouter router = GoRouter(
    initialLocation: '/',
    navigatorKey: _rootNavigatorKey,
    routes: [
      ShellRoute(
        navigatorKey: _shellNavigatorKey,
        builder: (context, state, child) {
          int index = 0;

          if (state.matchedLocation.startsWith('/files')) {
            index = 0;
          } else if (state.matchedLocation.startsWith('/clipboard')) {
            index = 1;
          } else if (state.matchedLocation.startsWith('/notifications')) {
            index = 2;
          } else if (state.matchedLocation.startsWith('/settings')) {
            index = 3;
          }

          return AppScaffold(currentIndex: index, child: child);
        },
        routes: [
          GoRoute(
            path: '/files',
            builder: (context, state) => const FilesScreen(),
          ),
          GoRoute(
            path: '/clipboard',
            builder: (context, state) => const ClipboardScreen(),
          ),
          GoRoute(
            path: '/settings',
            builder: (context, state) => const SettingsScreen(),
          ),
          GoRoute(
            path: '/notifications',
            builder: (context, state) => const NotificationsScreen(),
          ),
        ],
      ),
      // Non-tab routes
      GoRoute(path: '/', builder: (context, state) => const HomeScreen()),
      GoRoute(
        path: '/connect',
        builder: (context, state) => const ConnectScreen(),
      ),
    ],
  );
}
