import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_intermediate/models/task.dart';
import 'package:uuid/uuid.dart';

final taskListProvider =
    StateNotifierProvider<TaskList, List<Task>>((ref) => TaskList());

class TaskList extends StateNotifier<List<Task>> {
  TaskList() : super([]);

  void addTask(String task) {
    final newTask = Task(id: const Uuid().v4(), title: task);
    //Creates a new array with the task Added
    state = [...state, newTask];
  }

  void toggleTask(String id) {
    // When the id matches, we toggle the value of isCompleted
    state = state
        .map((task) => task.id == id
            ? Task(
                id: task.id, title: task.title, isCompleted: !task.isCompleted)
            : task)
        .toList();
  }

  void removeTask(String id) {
    //Removed the task with the matching id
    state = state.where((task) => task.id != id).toList();
  }
}
