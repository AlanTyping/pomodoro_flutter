import 'package:pomodoro_flutter/feature/task/domain/entities/task_entities.dart';
import 'package:pomodoro_flutter/feature/task/domain/repository/task_repository.dart';
import 'package:pomodoro_flutter/feature/task/domain/usecases/insert_task_usecase.dart';

final class SqlInsertTaskUsecase implements InsertTaskUsecase {
  SqlInsertTaskUsecase(TaskRepository repository) : _repository = repository;

  final TaskRepository _repository;

  @override
  Future<void> execute(Task task) async {
    await _repository.insertTask(task);
  }
}
