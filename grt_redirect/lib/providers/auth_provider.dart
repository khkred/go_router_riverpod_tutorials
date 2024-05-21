import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../notifiers/auth_notifier.dart';

final authProvider = StateNotifierProvider<AuthNotifier, Map<String, dynamic>>((ref) {
  return AuthNotifier();
});

