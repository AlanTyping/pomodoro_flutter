part of 'pomodoro_bloc.dart';

sealed class PomodoroEvent {}

final class StartPomodoro extends PomodoroEvent {}

final class PausePomodoro extends PomodoroEvent {}

final class ResumePomodoro extends PomodoroEvent {}

final class StopPomodoro extends PomodoroEvent {}

final class SkipCyclePomodoro extends PomodoroEvent {}

final class UpdateTitlePomodoro extends PomodoroEvent {
  final String title;

  UpdateTitlePomodoro(this.title);
}

final class _TickPomodoro extends PomodoroEvent {
  final int currentSeconds;

  _TickPomodoro(this.currentSeconds);
}

final class FinishPomodoro extends PomodoroEvent {}

final class UpdateSoundPomodoro extends PomodoroEvent {
  final String asset;

  UpdateSoundPomodoro({required this.asset});
}
