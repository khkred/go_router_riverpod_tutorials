import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_practice/providers/basic_providers.dart';

class CountStateProviderPage extends ConsumerWidget {
  const CountStateProviderPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentCount = ref.watch(countStateProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Count State Provider'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: Text('Current Count: $currentCount'),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          //This is how we access the value of the item inside a StateProvider
          //The following line should increase the value of count variable by 1.
          ref.read(countStateProvider.notifier).state++;
        },
      ),
    );
  }
}
