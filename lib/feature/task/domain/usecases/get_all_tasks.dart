import 'package:fpdart/fpdart.dart';
import 'package:pomodoro_flutter/core/failure.dart';
import 'package:pomodoro_flutter/core/usercase.dart';
import 'package:pomodoro_flutter/feature/task/domain/entities/task_entities.dart';
import 'package:pomodoro_flutter/feature/task/domain/repository/task_repository.dart';

class GetAllTasks implements AsyncUsecase<List<TaskEntity>, NoParams> {
  GetAllTasks(TaskRepository repository) : _repository = repository;

  final TaskRepository _repository;

  @override
  Future<Either<DatabaseFailure, List<TaskEntity>>> call(NoParams params) {
    return _repository.getAllTasks();
  }
}
