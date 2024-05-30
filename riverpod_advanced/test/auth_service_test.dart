import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_advanced/providers/auth_service_provider.dart';

void main() {

  test('AuthService login test', (){
    final container = ProviderContainer();
    final authService = container.read(authServiceProvider);

    expect(authService.login('admin', 'admin'), 'Login successful!');
    expect(authService.login('admin', 'wrong_password'), 'Login failed!');
  });
}