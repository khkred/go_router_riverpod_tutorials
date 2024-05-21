import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/auth_provider.dart';


class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GRT Redirect'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Home Page'),
            const SizedBox(height: 20),
            ElevatedButton(
                onPressed: () {
                  ref.read(authProvider.notifier).logout();
                },
                child: const Text('Logout')),
          ],
        ),
      ),
    );
  }
}
