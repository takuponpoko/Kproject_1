import 'package:freezed_annotation/freezed_annotation.dart';

part 'todo_list_screen_state.freezed.dart';

@freezed
class TodoListScreenState with _$TodoListScreenState {
  const factory TodoListScreenState({
    @Default([]) List<String> description,
    @Default(0) int dayCompleteTaskCount,
    @Default(0) int monthCompleteTaskCount,
    @Default(0) int yearCompleteTaskCount,
    @Default(0) int checkedTaskCount,
  }) = _TodoListScreenState;
}