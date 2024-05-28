import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_practice/providers/basic_providers.dart';

class StopWatchProviderPage extends ConsumerWidget {
  const StopWatchProviderPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final timerAsyncValue = ref.watch(timerStreamProvider);

    return Scaffold(
        appBar: AppBar(
          title: const Text('Stop Watch Stream Provider'),
        ),
        body: Center(
          child: timerAsyncValue.when(
              data: (timer) => Text(
                    'Clock: $timer',
                    style: const TextStyle(fontSize: 24),
                  ),
              error: (error, stackTrace) => Text('Error: ${error.toString()}'),
              loading: () => const CircularProgressIndicator()),
        ));
  }
}
