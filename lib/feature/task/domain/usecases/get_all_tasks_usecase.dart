import 'package:pomodoro_flutter/feature/task/domain/entities/task_entities.dart';

abstract interface class GetAllTasksUsecase {
  Future<List<Task>> execute();
}
