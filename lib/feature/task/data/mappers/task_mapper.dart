import 'package:pomodoro_flutter/feature/task/domain/entities/task_entities.dart';

import '../models/task_model.dart';

final class TaskMapper {
  Task fromModel(TaskModel model) {
    return Task(
      id: model.id,
      title: model.title,
      cycle: _getCycleFromName(model.cycle),
      completed: model.completed == 1,
      date: DateTime.parse(model.date),
    );
  }

  List<Task> fromListModel(List<TaskModel> list) {
    return list.map((e) => fromModel(e)).toList();
  }

  TaskModel fromTask(Task task) {
    return TaskModel(
      id: task.id,
      title: task.title,
      date: task.date.toIso8601String(),
      completed: task.completed ? 1 : 0,
      cycle: task.cycle.name,
    );
  }

  List<TaskModel> fromListTask(List<Task> list) {
    return list.map((e) => fromTask(e)).toList();
  }

  Cycle _getCycleFromName(String name) {
    if (name == Cycle.first.name) return Cycle.first;
    if (name == Cycle.second.name) return Cycle.second;
    if (name == Cycle.third.name) return Cycle.third;
    if (name == Cycle.fourth.name) return Cycle.fourth;

    return Cycle.first;
  }
}
