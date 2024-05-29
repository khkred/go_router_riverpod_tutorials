import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_advanced/providers/auto_dispose_counter_provider.dart';

class CounterPage extends HookConsumerWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final count = ref.watch(counterAutoDisposeProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter Auto Dispose'),
      ),
      body: Center(
        child: Text(
          'Count: $count',
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => ref.read(counterAutoDisposeProvider.notifier).state++,
        child: const Icon(Icons.add),
      ),
    );
  }
}
