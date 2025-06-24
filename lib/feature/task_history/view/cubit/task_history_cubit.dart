import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:pomodoro_flutter/feature/task/domain/entities/task_entities.dart';
import 'package:pomodoro_flutter/feature/task/domain/usecases/delete_task_usecase.dart';
import 'package:pomodoro_flutter/feature/task/domain/usecases/get_all_tasks_usecase.dart';

import 'task_history_state.dart';

final class TaskHistoryCubit extends Cubit<TaskHistoryState> {
  TaskHistoryCubit() : super(TaskHistoryState.initial()) {
    _fetchData();
  }

  final _fetchAllTasksUseCase = GetIt.I.get<GetAllTasksUsecase>();

  final _deleteTaskUseCase = GetIt.I.get<DeleteTaskUsecase>();

  Future<void> deleteTask(Task task) async {
    if (task.id != null) {
      await _deleteTaskUseCase.execute(task.id!);
      _fetchData();
    }
  }

  void _fetchData() async {
    emit(state.copyWith(isLoading: true));

    final tasks = await _fetchAllTasksUseCase.execute();

    emit(state.copyWith(tasks: tasks, isLoading: false, filteredTasks: tasks));
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
