import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test2/entity/todo_list_entity.dart';

class TodoRepository {
  static const String _keyTodos = 'todos';

  // TodoリストをSharedPreferencesに保存する
  Future<void> saveTodos(List<Todo> todos) async {
    final prefs = await SharedPreferences.getInstance();
    List<String> jsonList = todos.map((todo) => jsonEncode(todo.toJson())).toList();
    prefs.setStringList(_keyTodos, jsonList);
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
}
