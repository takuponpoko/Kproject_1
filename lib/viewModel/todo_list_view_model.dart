import 'dart:math';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test2/entity/todo_list_entity.dart';
import 'package:test2/viewModel/state/todo_list_screen_state.dart';

class TodoListViewModel extends AutoDisposeNotifier<TodoListScreenState> {
  TodoListViewModel();

  @override
  TodoListScreenState build() {
    return const TodoListScreenState();
  }

  String generateRandomString([int length = 32]) {
    const String charset = '0123456789ABCDEFGHIJKLMNOPQRSTUVXYZabcdefghijklmnopqrstuvwxyz-._';
    final Random random = Random.secure();
    final String randomStr =  List.generate(length, (_) => charset[random.nextInt(charset.length)]).join();
    return randomStr;
  }

   void addList(String task){
    final list = List<Todo>.from(state.todoTask ?? []);
    list.add(Todo(id: generateRandomString(), title: task, isSelected: false));
    state = state.copyWith(
      todoTask: list
    );
  }

  void removeList(int index){
    final list = List<Todo>.from(state.todoTask ?? []);
    list.remove(list[index]);
    state = state.copyWith(
        todoTask: list
    );
  }

  void changeSelected(int index){
    final list = List<Todo>.from(state.todoTask ?? []);
    list[index] = Todo(id: list[index].id, title: list[index].title, isSelected: !list[index].isSelected);
    state = state.copyWith(
      todoTask: list
    );
  }
}

final todoListViewModel =
    NotifierProvider.autoDispose<TodoListViewModel, TodoListScreenState>(
  () {
    return TodoListViewModel();
  },
);