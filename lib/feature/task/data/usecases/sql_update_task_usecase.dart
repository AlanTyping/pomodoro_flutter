import 'package:pomodoro_flutter/feature/task/domain/entities/task_entities.dart';
import 'package:pomodoro_flutter/feature/task/domain/repository/task_repository.dart';
import 'package:pomodoro_flutter/feature/task/domain/usecases/update_task_usecase.dart';

final class SqlUpdateTaskUsecase implements UpdateTaskUsecase {
  SqlUpdateTaskUsecase(TaskRepository repository) : _repository = repository;

  final TaskRepository _repository;

  @override
  Future<void> execute(Task task) async {
    await _repository.updateTask(task);
  }
}
