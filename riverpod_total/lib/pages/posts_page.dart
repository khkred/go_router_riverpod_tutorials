import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/basic_providers.dart';

class PostsPage extends ConsumerWidget {
  const PostsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final postsAsyncValue = ref.watch(postsProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Posts Page'),
      ),
      body: postsAsyncValue.when(data: (posts)=> ListView.builder(
        itemCount: posts.length,
        itemBuilder: (context, index) {
          final post = posts[index];
          return ListTile(
            title: Text(post.title),
            subtitle: Text(post.body),
          );
        },

      ), error: (error, stackTrace) => Center(child: Text('Error: $error'),), loading: ()=> const Center(child: CircularProgressIndicator())),
    );
  }
}