import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_advanced/providers/user_provider.dart';

class UserWidget extends HookConsumerWidget {
  final int userId;

  const UserWidget({super.key, required this.userId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userAsyncValue = ref.watch(userProvider(userId));
    return Padding(
      padding: const EdgeInsets.all(8),
      child: userAsyncValue.when(
          data: (user) => ListTile(
                title: Text(user.name),
                subtitle: Text(user.email),
              ),
          error: (error, stackTrace) => Text('Error: ${error.toString()}'),
          loading: () => const CircularProgressIndicator()),
    );
  }
}
