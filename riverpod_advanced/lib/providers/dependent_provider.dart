import 'package:hooks_riverpod/hooks_riverpod.dart';

final configProvider = StateProvider<String>((ref) => 'Config');

final dependentProvider = Provider<String>((ref) {
  final config = ref.watch(configProvider);

  return 'Depends on $config';
});
