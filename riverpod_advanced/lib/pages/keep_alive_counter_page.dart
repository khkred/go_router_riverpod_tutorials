import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_advanced/providers/keep_alive_counter_provider.dart';

class KeepAliveCounterPage extends HookConsumerWidget {
  const KeepAliveCounterPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final count = ref.watch(counterKeepAliveProvider);
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
        onPressed: () => ref.read(counterKeepAliveProvider.notifier).state++,
        child: const Icon(Icons.add),
      ),
    );
  }
}
