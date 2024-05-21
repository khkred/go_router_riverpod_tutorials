import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/auth_provider.dart';


class LoginPage extends ConsumerWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GRT Login'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('This is Login Page'),
            const SizedBox(height: 20),
            ElevatedButton(
                onPressed: () {
                  ref.read(authProvider.notifier).login();
                },
                child: const Text('Login')),
          ],
        ),
      ),
    );
  }
}
