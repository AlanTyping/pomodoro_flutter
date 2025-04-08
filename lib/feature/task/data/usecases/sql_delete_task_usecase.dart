import 'package:pomodoro_flutter/feature/task/domain/repository/task_repository.dart';
import 'package:pomodoro_flutter/feature/task/domain/usecases/delete_task_usecase.dart';

final class SqlDeleteTaskUsecase implements DeleteTaskUsecase {
  SqlDeleteTaskUsecase(TaskRepository repository) : _repository = repository;

  final TaskRepository _repository;
  @override
  Future<void> execute(int id) async {
    await _repository.deleteTask(id);
  }
}
