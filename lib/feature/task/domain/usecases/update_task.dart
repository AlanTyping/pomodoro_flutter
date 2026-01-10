import 'package:fpdart/fpdart.dart';
import 'package:pomodoro_flutter/core/failure.dart';
import 'package:pomodoro_flutter/core/usercase.dart';
import 'package:pomodoro_flutter/feature/task/domain/entities/task_entities.dart';
import 'package:pomodoro_flutter/feature/task/domain/repository/task_repository.dart';

class UpdateTask implements AsyncUsecase<Unit, UpdateTaskParams> {
  UpdateTask(TaskRepository repository) : _repository = repository;

  final TaskRepository _repository;

  @override
  Future<Either<DatabaseFailure, Unit>> call(UpdateTaskParams params) async {
    return _repository.updateTask(params.task);
  }
}

class UpdateTaskParams {
  final TaskEntity task;
  const UpdateTaskParams(this.task);
}
