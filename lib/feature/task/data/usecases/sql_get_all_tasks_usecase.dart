import 'package:pomodoro_flutter/feature/task/domain/entities/task_entities.dart';
import 'package:pomodoro_flutter/feature/task/domain/repository/task_repository.dart';
import 'package:pomodoro_flutter/feature/task/domain/usecases/get_all_tasks_usecase.dart';

final class SqlGetAllTasksUsecase implements GetAllTasksUsecase {
  SqlGetAllTasksUsecase(TaskRepository repository) : _repository = repository;

  final TaskRepository _repository;

  @override
  Future<List<Task>> execute() async {
    return await _repository.getAllTasks();
  }
}
