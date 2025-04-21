import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:pomodoro_flutter/feature/task/domain/usecases/get_all_tasks_usecase.dart';

import 'task_history_state.dart';

final class TaskHistoryCubit extends Cubit<TaskHistoryState> {
  TaskHistoryCubit() : super(TaskHistoryState.initial()) {
    _fetchData();
  }

  final GetAllTasksUsecase _fetchAllTasksUseCase =
      GetIt.I.get<GetAllTasksUsecase>();

  void _fetchData() async {
    emit(state.copyWith(isLoading: true));

    final tasks = await _fetchAllTasksUseCase.execute();

    emit(state.copyWith(tasks: tasks, isLoading: false));
  }
}
