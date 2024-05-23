import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_total/providers/basic_providers.dart';

class PostsStreamPage extends ConsumerWidget {
  const PostsStreamPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final postsStreamValue = ref.watch(postsStreamProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Posts Stream Page'),
      ),
      body: postsStreamValue.when(
          data: (posts) {
            return ListView.builder(
                itemCount: posts.length,
                itemBuilder: (context, index) {
                  final post = posts[index];
                  return ListTile(
                    title: Text(post.title),
                    subtitle: Text(post.body),
                  );
                });
          },
          error: (error, stackTrace) => Center(
                child: Text('Error: $error'),
              ),
          loading: () => const Center(
                child: CircularProgressIndicator(),
              )),
    );
  }
}
