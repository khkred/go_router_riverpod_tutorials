import 'package:flutter_riverpod/flutter_riverpod.dart';

class ToDoNotifier extends StateNotifier<List<String>> {
  ///Constructor:
  ///Whenever we extend a StateNotifier we need to create a constructor to declare the value we want to provide intially.
  ///In here we are returning an empty list of Strings
  ToDoNotifier() : super([]);

  void addTask(String task) {
    // We are adding a new Task String by creating a new Array using the spread operator
    state = [...state, task];
  }

  void removeTask(String task) {
    // We can remove the task and then create a new ArrayList
    state = state.where((item) => item != task).toList();
  }
}

//Finally let's create the todoNotifierProvider

final todoNotifierProvider =
    StateNotifierProvider<ToDoNotifier, List<String>>((ref) => ToDoNotifier());
