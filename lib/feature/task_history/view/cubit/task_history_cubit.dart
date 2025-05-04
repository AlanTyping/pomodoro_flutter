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

  void deleteTask(int id) async {
    await _deleteTaskUseCase.execute(id);
    _fetchData();
  }

  void _fetchData() async {
    emit(state.copyWith(isLoading: true));
    final tasks = await _fetchAllTasksUseCase.execute();

    /*tasks.add(
      Task(
        title: 'Mock task',
        date: DateTime(2025, 4, 25),
        completed: true,
        cyclesData: {
          Cycle.first: 1500,
          Cycle.second: 1500,
          Cycle.third: 500,
          Cycle.fourth: 0,
        },
      ),
    );*/
    // Agregar tareas simuladas
  tasks.addAll([
    Task(
      title: 'Estudiar Flutter',
      date: DateTime(2025, 5, 1),
      completed: true,
      cyclesData: {
        Cycle.first: 1500,
        Cycle.second: 1200,
        Cycle.third: 600,
        Cycle.fourth: 0,
      },
    ),
    Task(
      title: 'Leer libro',
      date: DateTime(2025, 5, 2),
      completed: false,
      cyclesData: {
        Cycle.first: 1500,
        Cycle.second: 0,
        Cycle.third: 0,
        Cycle.fourth: 0,
      },
    ),
    Task(
      title: 'Proyecto universidad',
      date: DateTime(2025, 5, 3),
      completed: false,
      cyclesData: {
        Cycle.first: 1500,
        Cycle.second: 1500,
        Cycle.third: 1500,
        Cycle.fourth: 1500,
      },
    ),
    Task(
      title: 'Mock task',
      date: DateTime(2025, 4, 25),
      completed: true,
      cyclesData: {
        Cycle.first: 1500,
        Cycle.second: 1500,
        Cycle.third: 500,
        Cycle.fourth: 0,
      },
    ),
    Task(
      title: 'Preparar presentación',
      date: DateTime(2025, 5, 1),
      completed: true,
      cyclesData: {
        Cycle.first: 1500,
        Cycle.second: 300,
        Cycle.third: 0,
        Cycle.fourth: 0,
      },
    ),
  ]);

    emit(
      state.copyWith(
        tasks: tasks,
        isLoading: false,
        filteredTasks:  tasks,
      ),
    );
  }

  void filterTasks({String? titleQuery, DateTime? date}) {
  final List<Task> filtered = state.tasks.where((task) {
    final matchesTitle = titleQuery == null || titleQuery.isEmpty
        ? true
        : task.title.toLowerCase().contains(titleQuery.toLowerCase());

    final matchesDate = date == null
        ? true
        : task.date.year == date.year &&
            task.date.month == date.month &&
            task.date.day == date.day;

    return matchesTitle && matchesDate;
  }).toList();

  emit(state.copyWith(filteredTasks: filtered));
}

}
