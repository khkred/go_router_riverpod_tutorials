import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthNotifier extends StateNotifier<Map<String, dynamic>> {
  AuthNotifier() : super({'loggedIn': false, 'role': 'guest'});

  void login(String role) {
    state = {'loggedIn': true, 'role': role};
    print('State change to true,  Logged in as $role');
  }

  void logout() {
    state = {'loggedIn': false, 'role': 'guest'};
    print('State change to false, Logged out');
  }
}
