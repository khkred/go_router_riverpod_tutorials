import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../pages/home_page.dart';
import '../pages/login_page.dart';
import '../providers/auth_provider.dart';

final routerProvider = Provider<GoRouter>((ref) {

  return GoRouter(
      initialLocation: '/home',
      routes: [
        GoRoute(path: '/home', builder: (context, state) => const HomePage()),
        GoRoute(path: '/login', builder: (context, state) => const LoginPage()),
      ],
      redirect: (context, state) {

        final loggedIn = ref.watch(authProvider);
        final isLoggingIn = state.path == '/login';

        if (!loggedIn && !isLoggingIn) {
          return '/login';
        } else if(loggedIn && isLoggingIn) {
          return '/home';
        }
        return null;
      });
});
