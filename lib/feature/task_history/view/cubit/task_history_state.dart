import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pomodoro_flutter/feature/task/domain/entities/task_entities.dart';

part 'task_history_state.freezed.dart';

@freezed
abstract class TaskHistoryState with _$TaskHistoryState {
  const factory TaskHistoryState({
    required List<Task> tasks,
    required List<Task> filteredTasks,
    String? nameFilter,
    DateTime? dateFilter,
    @Default(false) bool isLoading,
  }) = _TaskHistoryState;

  factory TaskHistoryState.initial() =>
      const TaskHistoryState(tasks: [], filteredTasks: []);
}
