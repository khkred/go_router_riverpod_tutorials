import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_advanced/providers/dependent_provider.dart';

class DependentProviderPage extends HookConsumerWidget {
  const DependentProviderPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dependentString = ref.watch(dependentProvider);
    return Scaffold(
        appBar: AppBar(
          title: const Text('Dependent Provider'),
        ),
        body: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                dependentString,
                style: const TextStyle(fontSize: 24),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                  onPressed: () =>
                      ref.read(configProvider.notifier).state = "New Config",
                  child: const Text('Change Config'))
            ],
          ),
        ));
  }
}
