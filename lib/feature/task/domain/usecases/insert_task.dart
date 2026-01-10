// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:fpdart/fpdart.dart';
import 'package:pomodoro_flutter/core/usercase.dart';
import 'package:pomodoro_flutter/feature/task/domain/entities/task_entities.dart';
import 'package:pomodoro_flutter/feature/task/domain/repository/task_repository.dart';

import '../../../../core/failure.dart';

final class InsertTask implements AsyncUsecase<int, InsertTaskParams> {
  InsertTask(TaskRepository repository) : _repository = repository;

  final TaskRepository _repository;

  @override
  Future<Either<DatabaseFailure, int>> call(InsertTaskParams params) async {
    return _repository.insertTask(params.task);
  }
}

class InsertTaskParams {
  final TaskEntity task;
  InsertTaskParams(this.task);
}
