import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:test2/entity/todo_list_entity.dart';

part 'todo_list_screen_state.freezed.dart';

@freezed
class TodoListScreenState with _$TodoListScreenState {
  const factory TodoListScreenState({
    @Default([]) List<Todo> todoTask,
    @Default('') String addText,
    @Default(0) int dayCompleteTaskCount,
    @Default(0) int monthCompleteTaskCount,
    @Default(0) int yearCompleteTaskCount,
  }) = _TodoListScreenState;
}
