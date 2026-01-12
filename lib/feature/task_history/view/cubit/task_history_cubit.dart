import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pomodoro_flutter/core/usercase.dart';
import 'package:pomodoro_flutter/feature/task/domain/entities/task_entities.dart';
import 'package:pomodoro_flutter/feature/task/domain/usecases/delete_task.dart';
import 'package:pomodoro_flutter/feature/task/domain/usecases/get_all_tasks.dart';
import 'package:pomodoro_flutter/feature/task/domain/usecases/insert_task.dart';
import 'package:pomodoro_flutter/feature/task/domain/usecases/update_task.dart';
import 'task_history_state.dart';

final class TaskHistoryCubit extends Cubit<TaskHistoryState> {
  final DeleteTask _deleteTask;
  final GetAllTasks _getAllTasks;
  // final InsertTask _insertTask;
  // final UpdateTask _updateTask;

  TaskHistoryCubit(
    DeleteTask deleteTask,
    GetAllTasks getAllTasks,
    InsertTask insertTask,
    UpdateTask updateTask,
  ) : _deleteTask = deleteTask,
      _getAllTasks = getAllTasks,
      // _insertTask = insertTask,
      // _updateTask = updateTask,
      super(TaskHistoryState.initial());

  void init() {
    _fetchData();
  }

  Future<void> deleteTask(TaskEntity task) async {
    if (task.id != null) {
      final result = await _deleteTask(DeleteParams(task.id!));
      result.fold(
        (l) => log("Error while deleting task: ${l.message}"),
        (r) => log("Task correctly deleted!"),
      );
    }
  }

  void _fetchData() async {
    emit(state.copyWith(isLoading: true));

    final result = await _getAllTasks(NoParams());

    result.fold(
      (l) => log("Error while getting tasks: ${l.message}"),
      (r) => emit(state.copyWith(tasks: r, isLoading: false, filteredTasks: r)),
    );
  }

  void changeNameFilter(String? value) =>
      emit(state.copyWith(nameFilter: value));

  void changeDateFilter(DateTime? date) =>
      emit(state.copyWith(dateFilter: date));

  void applyFilters() {
    final nameFilter = state.nameFilter?.toLowerCase();
    final dateFilter = state.dateFilter;

    final filtered =
        state.tasks.where((task) {
          final passesNameFilter =
              nameFilter == null ||
              nameFilter.isEmpty ||
              task.title.toLowerCase().contains(nameFilter);

          final passesDateFilter =
              dateFilter == null ||
              (dateFilter.day == task.date.day &&
                  dateFilter.month == task.date.month &&
                  dateFilter.year == task.date.year);

          return passesNameFilter && passesDateFilter;
        }).toList();

    emit(state.copyWith(filteredTasks: filtered));
  }

  void clearFilters() => emit(
    state.copyWith(
      dateFilter: null,
      nameFilter: null,
      filteredTasks: state.tasks,
    ),
  );
}
