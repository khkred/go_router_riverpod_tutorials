import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthNotifier extends StateNotifier<bool> {
  AuthNotifier() : super(false);

  void login() {
    state = true;
    print('State change to true,  Logged in');
  }

  void logout() {
    state = false;
  }
}
