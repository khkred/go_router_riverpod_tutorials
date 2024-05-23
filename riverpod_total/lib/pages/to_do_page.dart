import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_total/providers/todo_notifier.dart';

class ToDoPage extends ConsumerWidget {
  const ToDoPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todos = ref.watch(todoNotifierProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo Page'),
        ),
        body: SizedBox(
          width: double.infinity,
          child: ListView(
            children: todos.map((todo)=> ListTile(title: Text(todo),)).toList(),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            ref.read(todoNotifierProvider.notifier).addTodo('New Todo');
          },
          child: const Icon(Icons.add),
        ),
    );
  }
}
