import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_practice/providers/basic_providers.dart';

class HelloWorldProviderPage extends ConsumerWidget {
  const HelloWorldProviderPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final helloString = ref.watch(helloWorldProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hello World Provider'),
      ),
      body: Center(
        child: Text(
          helloString,
          style: const TextStyle(
            fontSize: 24,
          ),
        ),
      ),
    );
  }
}
