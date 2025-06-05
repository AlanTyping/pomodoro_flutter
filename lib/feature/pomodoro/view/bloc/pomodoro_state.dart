import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pomodoro_flutter/feature/task/domain/entities/task_entities.dart';

part 'pomodoro_state.freezed.dart';

enum PomodoroStatus { initial, running, pause, done }

@freezed
abstract class PomodoroState with _$PomodoroState {
  const factory PomodoroState({
    String? title,
    required Cycle cycle,
    required Duration timer,
    required Map<Cycle, int> cyclesData,
    @Default(false) bool isResting,
    String? audioAsset,
    required PomodoroStatus status,
  }) = _PomodoroState;

  factory PomodoroState.initial() => const PomodoroState(
    cycle: Cycle.first,
    timer: Duration(minutes: 25),
    status: PomodoroStatus.initial,
    cyclesData: {
      Cycle.first: 0,
      Cycle.second: 0,
      Cycle.third: 0,
      Cycle.fourth: 0,
    },
  );
}
