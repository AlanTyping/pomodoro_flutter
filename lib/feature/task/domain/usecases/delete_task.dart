import 'package:fpdart/fpdart.dart';
import 'package:pomodoro_flutter/core/failure.dart';
import 'package:pomodoro_flutter/core/usercase.dart';
import 'package:pomodoro_flutter/feature/task/domain/repository/task_repository.dart';

class DeleteTask implements AsyncUsecase<Unit, DeleteParams> {
  DeleteTask(TaskRepository repository) : _repository = repository;

  final TaskRepository _repository;
  @override
  Future<Either<DatabaseFailure, Unit>> call(DeleteParams params) {
    return _repository.deleteTask(params.id);
  }
}

class DeleteParams {
  final int id;
  const DeleteParams(this.id);
}
