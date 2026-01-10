import 'package:pomodoro_flutter/feature/task/data/models/task_model.dart';
import 'package:pomodoro_flutter/feature/task/domain/entities/task_entities.dart';

// Fecha fija para que todos los mosks coincidan
final DateTime fixedDate = DateTime(2025, 1, 1, 12, 0, 0);

// ---------------------------
// SINGLE MOCKS
// ---------------------------

final TaskEntity taskMock = TaskEntity(
  title: "terminar la app",
  date: fixedDate,
  completed: false,
);
final TaskModel taskModelMock = TaskModel(
  title: "terminar la app",
  date: fixedDate.toIso8601String(),
  secondsFirstCycle: 0,
  secondsSecondCycle: 0,
  secondsThirdCycle: 0,
  secondsFourthCycle: 0,
);

// ---------------------------
// LISTAS DE MOCKS
// ---------------------------

final List<TaskEntity> taskListMock = [
  TaskEntity(title: "tarea 1", date: fixedDate, completed: false),
  TaskEntity(title: "tarea 2", date: fixedDate, completed: false),
  TaskEntity(title: "tarea 3", date: fixedDate, completed: false),
];

final List<TaskModel> taskModelListMock = [
  TaskModel(
    title: "tarea 1",
    date: fixedDate.toIso8601String(),
    secondsFirstCycle: 0,
    secondsSecondCycle: 0,
    secondsThirdCycle: 0,
    secondsFourthCycle: 0,
  ),
  TaskModel(
    title: "tarea 2",
    date: fixedDate.toIso8601String(),
    secondsFirstCycle: 0,
    secondsSecondCycle: 0,
    secondsThirdCycle: 0,
    secondsFourthCycle: 0,
  ),
  TaskModel(
    title: "tarea 3",
    date: fixedDate.toIso8601String(),
    secondsFirstCycle: 0,
    secondsSecondCycle: 0,
    secondsThirdCycle: 0,
    secondsFourthCycle: 0,
  ),
];

final List<Map<String, dynamic>> taskJsonListMock =
    taskModelListMock.map((task) => task.toJson()).toList();
