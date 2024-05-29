import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() {
  runApp(
    const ProviderScope(child: MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.dark,
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: const Text('Overriding Providers Example'),
      ),
      body: Column(
        children: [
          const ProviderScope(child: GreetingWidget()),
          ProviderScope(
              overrides: [greetingProvider.overrideWithValue('Hello Riverpod')],
              child: const GreetingWidget()),
        ],
      ),
    );
  }
}

final greetingProvider = Provider<String>((ref) => 'Hello Word!!');

class GreetingWidget extends HookConsumerWidget {
  const GreetingWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final greeting = ref.watch(greetingProvider);

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Text(
        greeting,
        style: const TextStyle(fontSize: 24),
      ),
    );
  }
}
