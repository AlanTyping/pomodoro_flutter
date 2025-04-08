import 'package:pomodoro_flutter/feature/task/data/models/task_model.dart';
import 'package:pomodoro_flutter/feature/task/domain/entities/task_entities.dart';
import 'package:pomodoro_flutter/feature/task/domain/repository/task_repository.dart';
import 'package:pomodoro_flutter/feature/task/domain/usecases/insert_task_usecase.dart';

final class SqlInsertTaskUsecase implements InsertTaskUsecase {
  SqlInsertTaskUsecase(TaskRepository repository) : _repository = repository;

  final TaskRepository _repository;

  /*@override
  Future<void> execute(Task task) async {
    final taskModel = _mapTaskToEntity(task);
    await _repository.insertTask(taskModel);
  }

  TaskModel _mapTaskToEntity(Task task) {
    return TaskModel(
      title: task.title,
      date: task.date.toIso8601String(),
      completed: task.completed ? 1 : 0,
      cycle: task.cycle.name,
    );
  }*/

    Future<void> execute(TaskModel task) async {
    await _repository.insertTask(task);
  }
}