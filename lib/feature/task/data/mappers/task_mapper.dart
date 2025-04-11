import 'package:pomodoro_flutter/feature/task/domain/entities/task_entities.dart';

import '../models/task_model.dart';

final class TaskMapper {
  final totalDuration = const Duration(minutes: 30).inSeconds;

  Task fromModel(TaskModel model) {
    return Task(
      id: model.id,
      title: model.title,
      cyclesData:
          model.completed == 1
              ? {
                Cycle.first: totalDuration,
                Cycle.second: totalDuration,
                Cycle.third: totalDuration,
                Cycle.fourth: totalDuration,
              }
              : {
                Cycle.first: 0,
                Cycle.second: 0,
                Cycle.third: 0,
                Cycle.fourth: 0,
              },
      completed: model.completed == 1,
      date: DateTime.parse(model.date),
    );
  }

  List<Task> fromListModel(List<TaskModel> list) {
    return list.map((e) => fromModel(e)).toList();
  }

  TaskModel fromTask(Task task) {
    Cycle lastCycle = Cycle.first;

    task.cyclesData.forEach((cycle, second) {
      if (second > 0) lastCycle = cycle;
    });

    return TaskModel(
      id: task.id,
      title: task.title,
      date: task.date.toIso8601String(),
      completed: task.completed ? 1 : 0,
      cycle: lastCycle.name,
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
