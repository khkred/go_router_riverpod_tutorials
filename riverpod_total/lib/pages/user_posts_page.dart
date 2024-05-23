import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_total/models/user.dart';

import '../providers/basic_providers.dart';

class UserPostsPage extends ConsumerWidget {
  const UserPostsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userPosts = ref.watch(postsByUserProvider);
    final usersListAsyncValue = ref.watch(usersProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('User Posts Page'),
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            usersListAsyncValue.when(
              data: (users) {
                return DropdownButton<User>(
                    hint: const Text('Select a User'),
                    items: users
                        .map((user) => DropdownMenuItem(
                            value: user, child: Text(user.name)))
                        .toList(),
                    onChanged: (user) {
                      ref.read(selectedUserProvider.notifier).state = user;
                    });
              },
              error: (error, stackTrace) => Center(
                child: Text('Error: $error'),
              ),
              loading: () => const Center(
                child: CircularProgressIndicator(),
              ),
            ),
            Expanded(
              child: userPosts.when(data: (posts)=> ListView.builder(
                  itemCount: posts.length,
                  itemBuilder: (context, index) {
                    final post = posts[index];
                    return ListTile(
                      title: Text(post.title),
                      subtitle: Text(post.body),
                    );
                  },
              ),
                error: (error, stackTrace) => Center(
                  child: Text('Error: $error'),
                ),
                loading: () => const Center(
                  child: CircularProgressIndicator(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
