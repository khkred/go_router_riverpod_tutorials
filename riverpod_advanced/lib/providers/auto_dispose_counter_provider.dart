import 'package:hooks_riverpod/hooks_riverpod.dart';

final counterAutoDisposeProvider = StateProvider.autoDispose((ref) => 0);

