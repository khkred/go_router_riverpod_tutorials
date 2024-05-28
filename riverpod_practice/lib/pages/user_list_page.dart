import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_practice/providers/async_providers.dart';

class UserListPage extends ConsumerWidget {
  const UserListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final usersAsyncValue = ref.watch(usersListFutureProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Future Provider Users List'),
      ),
      body: Center(
        child: usersAsyncValue.when(
            data: (usersList) => ListView.builder(
                  itemCount: usersList.length,
                  itemBuilder: (context, index) {
                    final user = usersList[index];
                    return ListTile(
                      title: Text(user.name),
                      subtitle: Text(user.email),
                    );
                  },
                ),
            error: (error, stackTrace) => Text('error: $error'),
            loading: () => const CircularProgressIndicator()),
      ),
    );
  }
}
