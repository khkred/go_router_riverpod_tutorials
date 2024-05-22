import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthNotifier extends StateNotifier<Map<String, dynamic>> {
  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  AuthNotifier() : super({'loggedIn': false, 'role': 'guest'}) {
    _restoreState();
  }

  Future<void> _restoreState() async {
    //First read the loggedIn state from the storage
    final loggedIn = await _storage.read(key: 'loggedIn') == 'true';

    //Next read the role from the storage
    final role = await _storage.read(key: 'role') ?? 'guest';
    state = {'loggedIn': loggedIn, 'role': role};
  }

  Future<void> login(String role) async{
    state = {'loggedIn': true, 'role': role};
    print('State change to true,  Logged in as $role');

    //Save the loggedIn state to the storage
    await _storage.write(key: 'loggedIn', value: 'true');
    await _storage.write(key: 'role', value: role);
  }

  Future<void> logout() async{
    state = {'loggedIn': false, 'role': 'guest'};
    print('State change to false, Logged out');

    //Save the loggedOut state to the storage
    await _storage.write(key: 'loggedIn', value: 'false');
    await _storage.write(key: 'role', value: 'guest');
  }
}
