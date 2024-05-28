import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_practice/providers/basic_providers.dart';
import 'package:riverpod_practice/providers/to_do_notifier.dart';

class ToDoNotifierProviderPage extends ConsumerWidget {
  const ToDoNotifierProviderPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todoList = ref.watch(todoNotifierProvider);
    final count = ref.watch(countStateProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Current Todos'),
      ),
      body: ListView.builder(
          itemCount: todoList.length,
          itemBuilder: (context, index) {
            final todoItem = todoList[index];

            return ListTile(
              title: Text(todoItem),
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final currentTask = "Task: $count";
          ref.read(todoNotifierProvider.notifier).addTask(currentTask);

          //We'll increase the count after adding the task too
          ref.read(countStateProvider.notifier).state++;
        },
      ),
    );
  }
}
