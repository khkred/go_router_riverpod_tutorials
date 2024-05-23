import 'package:flutter_riverpod/flutter_riverpod.dart';

class TodoNotifier extends StateNotifier<List<String>> {
  TodoNotifier() : super([]);

  void addTodo(String todo) {
    state = [...state, todo];
  }

  void removeTodo(String todo) {
    state = state.where((element) => element != todo).toList();
  }
}

final todoNotifierProvider =
    StateNotifierProvider<TodoNotifier, List<String>>((ref) => TodoNotifier());
