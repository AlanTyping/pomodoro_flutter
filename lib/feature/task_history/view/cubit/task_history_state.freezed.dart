// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'task_history_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TaskHistoryState {
  List<Task> get tasks;
  List<Task> get filteredTasks;
  bool get isLoading;

  /// Create a copy of TaskHistoryState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $TaskHistoryStateCopyWith<TaskHistoryState> get copyWith =>
      _$TaskHistoryStateCopyWithImpl<TaskHistoryState>(
        this as TaskHistoryState,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is TaskHistoryState &&
            const DeepCollectionEquality().equals(other.tasks, tasks) &&
            const DeepCollectionEquality().equals(
              other.filteredTasks,
              filteredTasks,
            ) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(tasks),
    const DeepCollectionEquality().hash(filteredTasks),
    isLoading,
  );

  @override
  String toString() {
    return 'TaskHistoryState(tasks: $tasks, filteredTasks: $filteredTasks, isLoading: $isLoading)';
  }
}

/// @nodoc
abstract mixin class $TaskHistoryStateCopyWith<$Res> {
  factory $TaskHistoryStateCopyWith(
    TaskHistoryState value,
    $Res Function(TaskHistoryState) _then,
  ) = _$TaskHistoryStateCopyWithImpl;
  @useResult
  $Res call({List<Task> tasks, List<Task> filteredTasks, bool isLoading});
}

/// @nodoc
class _$TaskHistoryStateCopyWithImpl<$Res>
    implements $TaskHistoryStateCopyWith<$Res> {
  _$TaskHistoryStateCopyWithImpl(this._self, this._then);

  final TaskHistoryState _self;
  final $Res Function(TaskHistoryState) _then;

  /// Create a copy of TaskHistoryState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tasks = null,
    Object? filteredTasks = null,
    Object? isLoading = null,
  }) {
    return _then(
      _self.copyWith(
        tasks:
            null == tasks
                ? _self.tasks
                : tasks // ignore: cast_nullable_to_non_nullable
                    as List<Task>,
        filteredTasks:
            null == filteredTasks
                ? _self.filteredTasks
                : filteredTasks // ignore: cast_nullable_to_non_nullable
                    as List<Task>,
        isLoading:
            null == isLoading
                ? _self.isLoading
                : isLoading // ignore: cast_nullable_to_non_nullable
                    as bool,
      ),
    );
  }
}

/// @nodoc

class _TaskHistoryState implements TaskHistoryState {
  const _TaskHistoryState({
    required final List<Task> tasks,
    required final List<Task> filteredTasks,
    this.isLoading = false,
  }) : _tasks = tasks,
       _filteredTasks = filteredTasks;

  final List<Task> _tasks;
  @override
  List<Task> get tasks {
    if (_tasks is EqualUnmodifiableListView) return _tasks;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tasks);
  }

  final List<Task> _filteredTasks;
  @override
  List<Task> get filteredTasks {
    if (_filteredTasks is EqualUnmodifiableListView) return _filteredTasks;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_filteredTasks);
  }

  @override
  @JsonKey()
  final bool isLoading;

  /// Create a copy of TaskHistoryState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$TaskHistoryStateCopyWith<_TaskHistoryState> get copyWith =>
      __$TaskHistoryStateCopyWithImpl<_TaskHistoryState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _TaskHistoryState &&
            const DeepCollectionEquality().equals(other._tasks, _tasks) &&
            const DeepCollectionEquality().equals(
              other._filteredTasks,
              _filteredTasks,
            ) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_tasks),
    const DeepCollectionEquality().hash(_filteredTasks),
    isLoading,
  );

  @override
  String toString() {
    return 'TaskHistoryState(tasks: $tasks, filteredTasks: $filteredTasks, isLoading: $isLoading)';
  }
}

/// @nodoc
abstract mixin class _$TaskHistoryStateCopyWith<$Res>
    implements $TaskHistoryStateCopyWith<$Res> {
  factory _$TaskHistoryStateCopyWith(
    _TaskHistoryState value,
    $Res Function(_TaskHistoryState) _then,
  ) = __$TaskHistoryStateCopyWithImpl;
  @override
  @useResult
  $Res call({List<Task> tasks, List<Task> filteredTasks, bool isLoading});
}

/// @nodoc
class __$TaskHistoryStateCopyWithImpl<$Res>
    implements _$TaskHistoryStateCopyWith<$Res> {
  __$TaskHistoryStateCopyWithImpl(this._self, this._then);

  final _TaskHistoryState _self;
  final $Res Function(_TaskHistoryState) _then;

  /// Create a copy of TaskHistoryState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? tasks = null,
    Object? filteredTasks = null,
    Object? isLoading = null,
  }) {
    return _then(
      _TaskHistoryState(
        tasks:
            null == tasks
                ? _self._tasks
                : tasks // ignore: cast_nullable_to_non_nullable
                    as List<Task>,
        filteredTasks:
            null == filteredTasks
                ? _self._filteredTasks
                : filteredTasks // ignore: cast_nullable_to_non_nullable
                    as List<Task>,
        isLoading:
            null == isLoading
                ? _self.isLoading
                : isLoading // ignore: cast_nullable_to_non_nullable
                    as bool,
      ),
    );
  }
}
