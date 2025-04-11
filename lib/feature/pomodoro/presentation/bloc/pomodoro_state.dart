import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pomodoro_flutter/feature/task/domain/entities/task_entities.dart';

part 'pomodoro_state.freezed.dart';

@freezed
abstract class PomodoroState with _$PomodoroState {
  const factory PomodoroState({
    String? title,
    required Cycle cycle,
    required Duration timer,
    required Map<Cycle, int> cyclesData,
    required bool isRunning,
    @Default(false) bool isResting,
  }) = _PomodoroState;

  factory PomodoroState.initial() => const PomodoroState(
    title: null,
    cycle: Cycle.first,
    timer: Duration.zero,
    isRunning: false,
    cyclesData: {
      Cycle.first: 0,
      Cycle.second: 0,
      Cycle.third: 0,
      Cycle.fourth: 0,
    },
  );
}
