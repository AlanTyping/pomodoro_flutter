import 'package:fpdart/fpdart.dart';
import 'package:pomodoro_flutter/core/failure.dart';

import '../entities/task_entities.dart';

// Clase abstracta con el objetivo de solo mencionar las acciones, sin ninguna instanciación
abstract interface class TaskRepository {
  Future<Either<DatabaseFailure, int>> insertTask(TaskEntity task);
  Future<Either<DatabaseFailure, Unit>> updateTask(TaskEntity task);
  Future<Either<DatabaseFailure, Unit>> deleteTask(int id);
  Future<Either<DatabaseFailure, List<TaskEntity>>> getAllTasks();
}
