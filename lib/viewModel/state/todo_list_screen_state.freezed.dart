// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'todo_list_screen_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$TodoListScreenState {
  List<String> get description => throw _privateConstructorUsedError;
  int get dayCompleteTaskCount => throw _privateConstructorUsedError;
  int get monthCompleteTaskCount => throw _privateConstructorUsedError;
  int get yearCompleteTaskCount => throw _privateConstructorUsedError;
  int get checkedTaskCount => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TodoListScreenStateCopyWith<TodoListScreenState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TodoListScreenStateCopyWith<$Res> {
  factory $TodoListScreenStateCopyWith(
          TodoListScreenState value, $Res Function(TodoListScreenState) then) =
      _$TodoListScreenStateCopyWithImpl<$Res, TodoListScreenState>;
  @useResult
  $Res call(
      {List<String> description,
      int dayCompleteTaskCount,
      int monthCompleteTaskCount,
      int yearCompleteTaskCount,
      int checkedTaskCount});
}

/// @nodoc
class _$TodoListScreenStateCopyWithImpl<$Res, $Val extends TodoListScreenState>
    implements $TodoListScreenStateCopyWith<$Res> {
  _$TodoListScreenStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? description = null,
    Object? dayCompleteTaskCount = null,
    Object? monthCompleteTaskCount = null,
    Object? yearCompleteTaskCount = null,
    Object? checkedTaskCount = null,
  }) {
    return _then(_value.copyWith(
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as List<String>,
      dayCompleteTaskCount: null == dayCompleteTaskCount
          ? _value.dayCompleteTaskCount
          : dayCompleteTaskCount // ignore: cast_nullable_to_non_nullable
              as int,
      monthCompleteTaskCount: null == monthCompleteTaskCount
          ? _value.monthCompleteTaskCount
          : monthCompleteTaskCount // ignore: cast_nullable_to_non_nullable
              as int,
      yearCompleteTaskCount: null == yearCompleteTaskCount
          ? _value.yearCompleteTaskCount
          : yearCompleteTaskCount // ignore: cast_nullable_to_non_nullable
              as int,
      checkedTaskCount: null == checkedTaskCount
          ? _value.checkedTaskCount
          : checkedTaskCount // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TodoListScreenStateImplCopyWith<$Res>
    implements $TodoListScreenStateCopyWith<$Res> {
  factory _$$TodoListScreenStateImplCopyWith(_$TodoListScreenStateImpl value,
          $Res Function(_$TodoListScreenStateImpl) then) =
      __$$TodoListScreenStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<String> description,
      int dayCompleteTaskCount,
      int monthCompleteTaskCount,
      int yearCompleteTaskCount,
      int checkedTaskCount});
}

/// @nodoc
class __$$TodoListScreenStateImplCopyWithImpl<$Res>
    extends _$TodoListScreenStateCopyWithImpl<$Res, _$TodoListScreenStateImpl>
    implements _$$TodoListScreenStateImplCopyWith<$Res> {
  __$$TodoListScreenStateImplCopyWithImpl(_$TodoListScreenStateImpl _value,
      $Res Function(_$TodoListScreenStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? description = null,
    Object? dayCompleteTaskCount = null,
    Object? monthCompleteTaskCount = null,
    Object? yearCompleteTaskCount = null,
    Object? checkedTaskCount = null,
  }) {
    return _then(_$TodoListScreenStateImpl(
      description: null == description
          ? _value._description
          : description // ignore: cast_nullable_to_non_nullable
              as List<String>,
      dayCompleteTaskCount: null == dayCompleteTaskCount
          ? _value.dayCompleteTaskCount
          : dayCompleteTaskCount // ignore: cast_nullable_to_non_nullable
              as int,
      monthCompleteTaskCount: null == monthCompleteTaskCount
          ? _value.monthCompleteTaskCount
          : monthCompleteTaskCount // ignore: cast_nullable_to_non_nullable
              as int,
      yearCompleteTaskCount: null == yearCompleteTaskCount
          ? _value.yearCompleteTaskCount
          : yearCompleteTaskCount // ignore: cast_nullable_to_non_nullable
              as int,
      checkedTaskCount: null == checkedTaskCount
          ? _value.checkedTaskCount
          : checkedTaskCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$TodoListScreenStateImpl implements _TodoListScreenState {
  const _$TodoListScreenStateImpl(
      {final List<String> description = const [],
      this.dayCompleteTaskCount = 0,
      this.monthCompleteTaskCount = 0,
      this.yearCompleteTaskCount = 0,
      this.checkedTaskCount = 0})
      : _description = description;

  final List<String> _description;
  @override
  @JsonKey()
  List<String> get description {
    if (_description is EqualUnmodifiableListView) return _description;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_description);
  }

  @override
  @JsonKey()
  final int dayCompleteTaskCount;
  @override
  @JsonKey()
  final int monthCompleteTaskCount;
  @override
  @JsonKey()
  final int yearCompleteTaskCount;
  @override
  @JsonKey()
  final int checkedTaskCount;

  @override
  String toString() {
    return 'TodoListScreenState(description: $description, dayCompleteTaskCount: $dayCompleteTaskCount, monthCompleteTaskCount: $monthCompleteTaskCount, yearCompleteTaskCount: $yearCompleteTaskCount, checkedTaskCount: $checkedTaskCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TodoListScreenStateImpl &&
            const DeepCollectionEquality()
                .equals(other._description, _description) &&
            (identical(other.dayCompleteTaskCount, dayCompleteTaskCount) ||
                other.dayCompleteTaskCount == dayCompleteTaskCount) &&
            (identical(other.monthCompleteTaskCount, monthCompleteTaskCount) ||
                other.monthCompleteTaskCount == monthCompleteTaskCount) &&
            (identical(other.yearCompleteTaskCount, yearCompleteTaskCount) ||
                other.yearCompleteTaskCount == yearCompleteTaskCount) &&
            (identical(other.checkedTaskCount, checkedTaskCount) ||
                other.checkedTaskCount == checkedTaskCount));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_description),
      dayCompleteTaskCount,
      monthCompleteTaskCount,
      yearCompleteTaskCount,
      checkedTaskCount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TodoListScreenStateImplCopyWith<_$TodoListScreenStateImpl> get copyWith =>
      __$$TodoListScreenStateImplCopyWithImpl<_$TodoListScreenStateImpl>(
          this, _$identity);
}

abstract class _TodoListScreenState implements TodoListScreenState {
  const factory _TodoListScreenState(
      {final List<String> description,
      final int dayCompleteTaskCount,
      final int monthCompleteTaskCount,
      final int yearCompleteTaskCount,
      final int checkedTaskCount}) = _$TodoListScreenStateImpl;

  @override
  List<String> get description;
  @override
  int get dayCompleteTaskCount;
  @override
  int get monthCompleteTaskCount;
  @override
  int get yearCompleteTaskCount;
  @override
  int get checkedTaskCount;
  @override
  @JsonKey(ignore: true)
  _$$TodoListScreenStateImplCopyWith<_$TodoListScreenStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
