import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
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

    emit(state.copyWith(tasks: tasks, isLoading: false));
  }
}
