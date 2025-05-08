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

  final GetAllTasksUsecase _fetchAllTasksUseCase =
      GetIt.I.get<GetAllTasksUsecase>();

  final DeleteTaskUsecase _deleteTaskUseCase = GetIt.I.get<DeleteTaskUsecase>();

  void deleteTask(Task task) async {
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

  void changeNameFilter(String? value) {
    if (value?.isEmpty ?? true) {
      emit(state.copyWith(nameFilter: value));
    }
  }

  void changeDateFilter(DateTime? date) {
    emit(state.copyWith(dateFilter: date));
  }

  void applyFilters() {
    final List<Task> filtered =
        state.tasks.where((task) {
          // Default to true when filter is not set
          bool titleValidation =
              state.nameFilter == null || state.nameFilter!.isEmpty;
          bool dateValidation = state.dateFilter == null;

          // Only check title if filter is set
          if (state.nameFilter case final title? when title.isNotEmpty) {
            titleValidation = task.title.toLowerCase().contains(
              title.toLowerCase(),
            );
          }

          // Only check date if filter is set
          if (state.dateFilter case final date?) {
            dateValidation =
                date.day == task.date.day &&
                date.month == task.date.month &&
                date.year == task.date.year;
          }

          // Task passes if it matches all applied filters
          return titleValidation && dateValidation;
        }).toList();

    emit(state.copyWith(filteredTasks: filtered));
  }

  void clearFilters() {
    emit(
      state.copyWith(
        dateFilter: null,
        nameFilter: null,
        filteredTasks: state.tasks,
      ),
    );
  }
}
