import 'dart:math';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test2/entity/todo_list_entity.dart';
import 'package:test2/repository/todo_repository.dart';
import 'package:test2/viewModel/state/todo_list_screen_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class TodoListViewModel extends AutoDisposeNotifier<TodoListScreenState> {
  TodoListViewModel();

  final TodoRepository _repository = TodoRepository();

  @override
  TodoListScreenState build() {
    return const TodoListScreenState();
  }

  String generateRandomString([int length = 10]) {
    const String charset =
        '0123456789ABCDEFGHIJKLMNOPQRSTUVXYZabcdefghijklmnopqrstuvwxyz-._';
    final Random random = Random.secure();
    final String randomStr =
        List.generate(length, (_) => charset[random.nextInt(charset.length)])
            .join();
    return randomStr;
  }

  Future<void> initialSet() async{
    DateTime now = DateTime.now();
    var nowDay = (now.year * 10000) + (now.month * 100) + now.day;
    final list = await _repository.loadTodos();
    final dayCompleteTask = await _repository.loadDayCompleteTask();
    state = state.copyWith(
      todoTask: list,
      dayCompleteTaskCount: dayCompleteTask
    );
    if(nowDay > state.lastAddDay){
      state = state.copyWith(
        dayCompleteTaskCount: 0
      );
    }
  }

  void changeTask(String task) {
    state = state.copyWith(taskText: task);
    state = state.copyWith(canAdd: state.taskText.isNotEmpty);
  }

  void clearText() {
    state = state.copyWith(taskText: '', canAdd: false);
  }

  Future<void> addList() async {
    final list = List<Todo>.from(state.todoTask);
    var addText = state.taskText;
    final random = generateRandomString();
    if (addText.isEmpty) {
      addText = '未入力タスク(id：$random)';
    }
    list.add(Todo(id: random, title: addText, isSelected: false));
    state = state.copyWith(todoTask: list, taskText: '', canAdd: false);
    await _repository.saveTodos(list,state.dayCompleteTaskCount);
  }

  Future<void> removeList(int index) async {
    final list = List<Todo>.from(state.todoTask);
    list.remove(list[index]);
    state = state.copyWith(todoTask: list);
    await _repository.saveTodos(list, state.dayCompleteTaskCount);
  }

  Future<void> changeSelected(int index) async{
    final list = List<Todo>.from(state.todoTask);
    list[index] = Todo(
        id: list[index].id,
        title: list[index].title,
        isSelected: !list[index].isSelected);
    state = state.copyWith(todoTask: list);
    await _repository.saveTodos(list, state.dayCompleteTaskCount);
  }

  void addLastDay(DateTime time){
    state = state.copyWith(
      lastAddDay: (time.year * 10000) + (time.month * 100) + time.day
    );
  }

  void resetDay() {
    state = state.copyWith(
      dayCompleteTaskCount: 0
    );
  }

  Future<void> completeTask() async {
    final taskAchieve = state.dayCompleteTaskCount +
        List<Todo>.from(state.todoTask)
            .where((e) => e.isSelected == true)
            .toList()
            .length;
    final list = List<Todo>.from(state.todoTask)
        .where((e) => e.isSelected == false)
        .toList();
    state = state.copyWith(todoTask: list, dayCompleteTaskCount: taskAchieve);
    await _repository.saveTodos(list, state.dayCompleteTaskCount);
  }
}

final todoListViewModel =
    NotifierProvider.autoDispose<TodoListViewModel, TodoListScreenState>(
  () {
    return TodoListViewModel();
  },
);
