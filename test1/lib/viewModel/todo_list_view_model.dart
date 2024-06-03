import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test2/viewModel/state/todo_list_screen_state.dart';

class TodoListViewModel extends AutoDisposeNotifier<TodoListScreenState> {
  TodoListViewModel();

  @override
  TodoListScreenState build() {
    return const TodoListScreenState();
  }
}

final todoListViewModel =
    NotifierProvider.autoDispose<TodoListViewModel, TodoListScreenState>(
  () {
    return TodoListViewModel();
  },
);
