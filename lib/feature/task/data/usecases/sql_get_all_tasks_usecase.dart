import 'package:pomodoro_flutter/feature/task/domain/entities/task_entities.dart';
import 'package:pomodoro_flutter/feature/task/domain/repository/task_repository.dart';
import 'package:pomodoro_flutter/feature/task/domain/usecases/get_all_tasks_usecase.dart';

final class SqlGetAllTasksUsecase implements GetAllTasksUsecase {
  SqlGetAllTasksUsecase(TaskRepository repository) : _repository = repository;

  final TaskRepository _repository;

  @override
  Future<List<Task>> execute() async {
    final entities = await _repository.getAllTasks();
    return entities
        .map(
          (entity) => Task(
            title: entity.title,
            date: DateTime.parse(entity.date),
            completed: entity.completed == 1,
            cycle: _getCycleFromName(entity.cycle),
          ),
        )
        .toList();
  }

  Cycle _getCycleFromName(String name) {
    if (name == Cycle.first.name) return Cycle.first;
    if (name == Cycle.second.name) return Cycle.second;
    if (name == Cycle.third.name) return Cycle.third;
    if (name == Cycle.fourth.name) return Cycle.fourth;

    return Cycle.first;
  }
}
