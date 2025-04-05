import 'package:pomodoro_flutter/feature/task/domain/entities/task_entities.dart';

sealed class PomodoroState {}

final class PomodoroInitialState extends PomodoroState {}

final class PomodoroStartState extends PomodoroState {
  final Task task;

  PomodoroStartState({required this.task});
}

final class PomodoroRunningState extends PomodoroState {
  final int currentSeconds;
  final Task task;

  PomodoroRunningState({required this.currentSeconds, required this.task});
}

final class PomodoroPausedState extends PomodoroState {
  final int currentSeconds;
  final String title;
  final Task task;

  PomodoroPausedState(
    this.task, {
    required this.currentSeconds,
    required this.title,
  });
}
