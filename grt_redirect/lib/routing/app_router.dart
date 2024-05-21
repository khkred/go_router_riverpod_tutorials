import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:grt_redirect/pages/admin_page.dart';

import '../pages/account_page.dart';
import '../pages/home_page.dart';
import '../pages/login_page.dart';
import '../pages/profile_page.dart';
import '../pages/settings_page.dart';
import '../providers/auth_provider.dart';

FutureOr<String?> redirectIfNotLoggedIn(ProviderRef ref) {
  final loggedIn = ref.watch(authProvider);
  if (!loggedIn) {
    return '/login';
  }
  return null;
}

final routerProvider = Provider<GoRouter>((ref) {
  return GoRouter(
      initialLocation: '/home',
      routes: [
        GoRoute(
          path: '/home',
          builder: (context, state) => const HomePage(),
          routes: [
            GoRoute(
              path: 'profile',
              builder: (context, state) => const ProfilePage(),
              redirect: (context, state) => redirectIfNotLoggedIn(ref),
            ),
            GoRoute(
              path: 'settings',
              builder: (context, state) => const SettingsPage(),
              routes: [
                GoRoute(
                  path: 'account',
                  builder: (context, state) => const AccountPage(),
                  redirect: (context, state) => redirectIfNotLoggedIn(ref),
                ),
              ],
              redirect: (context, state) => redirectIfNotLoggedIn(ref),
            ),
          ],
          redirect: (context, state) => redirectIfNotLoggedIn(ref),
        ),
        GoRoute(path: '/login', builder: (context, state) => const LoginPage()),
        GoRoute(
          path: '/admin',
          builder: (context, state) => const AdminPage(),
          redirect: (context, state) => redirectIfNotLoggedIn(ref),
        ),
      ],
      redirect: (context, state) {
        final loggedIn = ref.watch(authProvider);
        final isLoggingIn = state.path == '/login';

        if (!loggedIn && !isLoggingIn) {
          return '/login';
        } else if (loggedIn && isLoggingIn) {
          return '/home';
        }
        return null;
      });
});
