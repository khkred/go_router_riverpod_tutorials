import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';


//Let's define a simple counterProvider
final counterProvider = StateProvider<int>((ref) => 0);

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
      appBar: AppBar(title: const Text('Riverpod ProviderScope Example'),
      ),
      body: SizedBox(width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const ProviderScope(child: CounterWidget()),
          ProviderScope(
              overrides: [counterProvider.overrideWith((ref) => 100)],
              child: const CounterWidget()),
        ],
      ),),
    );
  }
}

class CounterWidget extends HookConsumerWidget {
  const CounterWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final counter = ref.watch(counterProvider);
    return Column(
      children: [
        Text('Value: $counter',
        style: const TextStyle(fontWeight: FontWeight.bold,
        fontSize: 24),),

        ElevatedButton(onPressed: (){
          ref.read(counterProvider.notifier).state++;
        }, child: const Text('Increment'),)
      ],
    );
  }
}
