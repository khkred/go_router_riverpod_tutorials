import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_advanced/service/auth_service.dart';

final authServiceProvider = Provider<AuthService>((ref) => AuthService());
