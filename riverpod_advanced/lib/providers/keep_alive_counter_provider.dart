
import 'package:hooks_riverpod/hooks_riverpod.dart';

final counterKeepAliveProvider = StateProvider.autoDispose<int>((ref) {
  ref.keepAlive();
  return 0;
});