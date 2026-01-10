import 'package:pomodoro_flutter/feature/task/domain/entities/task_entities.dart';

import '../models/task_model.dart';

class TaskMapper {
  final totalDuration = const Duration(minutes: 30).inSeconds;

  // testeado
  TaskEntity fromModel(TaskModel model) {
    final isCompleted =
        model.secondsFirstCycle == totalDuration &&
        model.secondsSecondCycle == totalDuration &&
        model.secondsThirdCycle == totalDuration &&
        model.secondsFourthCycle == totalDuration;

    return TaskEntity(
      id: model.id,
      title: model.title,
      cyclesData: {
        Cycle.first: model.secondsFirstCycle,
        Cycle.second: model.secondsSecondCycle,
        Cycle.third: model.secondsThirdCycle,
        Cycle.fourth: model.secondsFourthCycle,
      },
      completed: isCompleted,
      date: DateTime.parse(model.date),
    );
  }

  List<TaskModel> fromJsonList(List<Map<String, dynamic>> list) {
    return list.map((e) => TaskModel.fromJson(e)).toList();
  }

  // testeado
  List<TaskEntity> fromListModel(List<TaskModel> list) {
    return list.map((e) => fromModel(e)).toList();
  }

  // testeado
  TaskModel fromTask(TaskEntity task) {
    final cyclesData = task.cyclesData.values;

    return TaskModel(
      id: task.id,
      title: task.title,
      date: task.date.toIso8601String(),
      secondsFirstCycle: cyclesData.elementAt(0),
      secondsSecondCycle: cyclesData.elementAt(1),
      secondsThirdCycle: cyclesData.elementAt(2),
      secondsFourthCycle: cyclesData.elementAt(3),
    );
  }

  List<TaskModel> fromListTask(List<TaskEntity> list) {
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
