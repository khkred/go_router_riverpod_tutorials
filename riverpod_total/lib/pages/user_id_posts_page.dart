import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_total/providers/basic_providers.dart';

import '../models/user.dart';

class UserIdPostsPage extends ConsumerWidget {
  const UserIdPostsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final usersListAsync = ref.watch(usersProvider);
    final selectedUser = ref.watch(selectedUserProvider);

    final postsAsyncValue = selectedUser == null
        ? const AsyncValue.data([])
        : ref.watch(postsByUserIdProvider(selectedUser.id));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Users and Posts with Family'),
      ),
      body: Column(
        children: [
          usersListAsync.when(
            data: (users) {
              return DropdownButton<User>(
                hint: const Text('Select a User'),
                value: selectedUser,
                onChanged: (user) {
                  ref.read(selectedUserProvider.notifier).state = user;
                },
                items: users.map((user) {
                  return DropdownMenuItem<User>(
                    value: user,
                    child: Text(user.name),
                  );
                }).toList(),
              );
            },
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (error, stack) => Text('Error: $error'),
          ),
          Expanded(
            child: postsAsyncValue.when(
              data: (posts) {
                return ListView.builder(
                  itemCount: posts.length,
                  itemBuilder: (context, index) {
                    final post = posts[index];
                    return ListTile(
                      title: Text(post.title),
                      subtitle: Text(post.body),
                    );
                  },
                );
              },
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (error, stack) => Center(child: Text('Error: $error')),
            ),
          ),
        ],
      ),
    );
  }
}
