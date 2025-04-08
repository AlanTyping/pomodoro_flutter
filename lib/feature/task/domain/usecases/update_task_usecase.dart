import 'package:pomodoro_flutter/feature/task/data/models/task_model.dart';

abstract interface class UpdateTaskUsecase {
  Future<void> execute(TaskModel task);
}