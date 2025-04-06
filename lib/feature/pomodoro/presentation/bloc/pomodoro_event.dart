import 'package:freezed_annotation/freezed_annotation.dart';

part 'pomodoro_event.freezed.dart';

@freezed
sealed class PomodoroEvent with _$PomodoroEvent {
  const factory PomodoroEvent.start() = StartPomodoro;
  const factory PomodoroEvent.pause() = PausePomodoro;
  const factory PomodoroEvent.resume() = ResumePomodoro;
  const factory PomodoroEvent.stop() = StopPomodoro;
  const factory PomodoroEvent.skipCycle() = SkipCyclePomodoro;
  const factory PomodoroEvent.updateTitle(String title) = UpdateTitlePomodoro;
  const factory PomodoroEvent.tick(int currentSeconds) = TickPomodoro;
}
