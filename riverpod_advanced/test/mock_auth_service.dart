import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_advanced/providers/auth_service_provider.dart';
import 'package:riverpod_advanced/service/auth_service.dart';

class MockAuthService extends AuthService {
  @override
  String login(String username, String password) {
    return 'Mock login for $username';
  }
}

void main(){
  test('AuthService mock test', (){
    final container = ProviderContainer(
      overrides: [authServiceProvider.overrideWithValue(MockAuthService())]
    );

    final authService = container.read(authServiceProvider);

    expect(authService.login('test', 'test'), 'Mock login for test');
  });
}
