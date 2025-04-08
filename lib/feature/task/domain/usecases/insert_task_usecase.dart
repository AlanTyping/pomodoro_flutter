import 'package:pomodoro_flutter/feature/task/data/models/task_model.dart';
import 'package:pomodoro_flutter/feature/task/domain/entities/task_entities.dart';

abstract interface class InsertTaskUsecase {
  Future<void> execute(TaskModel task);
}