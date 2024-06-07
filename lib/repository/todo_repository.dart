import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test2/entity/todo_list_entity.dart';

class TodoRepository {
  static const String _keyTodos = 'todos';
  static const String _day = 'day';

  // TodoリストをSharedPreferencesに保存する
  Future<void> saveTodos(List<Todo> todos, int dayCompleteTask) async {
    final prefs = await SharedPreferences.getInstance();
    List<String> jsonList = todos.map((todo) => jsonEncode(todo.toJson())).toList();
    prefs.setStringList(_keyTodos, jsonList);
    prefs.setInt(_day, dayCompleteTask);
  }

  // SharedPreferencesからTodoリストを読み出す
  Future<List<Todo>> loadTodos() async {
    final prefs = await SharedPreferences.getInstance();
    List<String>? jsonList = prefs.getStringList(_keyTodos);

    if (jsonList != null) {
      return jsonList.map((json) => Todo.fromJson(jsonDecode(json))).toList();
    } else {
      return [];
    }
  }

  Future<int> loadDayCompleteTask() async {
    final prefs = await SharedPreferences.getInstance();
    int? day = prefs.getInt(_day);

    if (day != null) {
      return day;
    } else {
      return 0;
    }
  }
}
