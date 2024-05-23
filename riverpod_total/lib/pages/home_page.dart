import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_total/pages/posts_page.dart';
import 'package:riverpod_total/pages/posts_stream_page.dart';
import 'package:riverpod_total/pages/to_do_page.dart';
import 'package:riverpod_total/pages/user_posts_page.dart';

import '../providers/basic_providers.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final count = ref.watch(counterProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              ref.watch(helloWorldProvider),
              style: const TextStyle(
                fontSize: 24,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'Count: $count',
              style: const TextStyle(
                fontSize: 24,
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
                onPressed: () {
                  ref.read(counterProvider.notifier).state++;
                },
                child: const Text('Increment')),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ToDoPage()));
                },
                child: const Text('Go to TODO Page')),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const PostsPage()));
                },
                child: const Text('Go to Posts Page')),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const PostsStreamPage()));
                },
                child: const Text('Go to Posts Stream Page')),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const UserPostsPage()));
                },
                child: const Text('Go to Users Posts Page')),
          ],
        ),
      ),
    );
  }
}
