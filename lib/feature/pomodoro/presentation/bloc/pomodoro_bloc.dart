import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pomodoro_flutter/feature/pomodoro/presentation/bloc/pomodoro_event.dart';
import 'package:pomodoro_flutter/feature/pomodoro/presentation/bloc/pomodoro_state.dart';
import 'package:pomodoro_flutter/feature/task/domain/entities/task_entities.dart';

final class PomodoroBloc extends Bloc<PomodoroEvent, PomodoroState> {
  static const Duration _workDuration = Duration(minutes: 25);
  static const Duration _restMinutes = Duration(minutes: 5);

  StreamSubscription<int>? _streamSubscription;

  PomodoroBloc() : super(PomodoroState.initial()) {
    on<StartPomodoro>(_onStart);
    on<TickPomodoro>(_onTick);
    on<PausePomodoro>(_onPaused);
  }

  Cycle get _getNextCycle => switch (state.cycle) {
    Cycle.first => Cycle.second,
    Cycle.second => Cycle.third,
    Cycle.third => Cycle.fourth,
    Cycle.fourth => Cycle.first,
  };

  void _onStart(StartPomodoro event, Emitter<PomodoroState> emit) {
    emit(state.copyWith(isRunning: true));

    _streamSubscription?.cancel();

    _streamSubscription = _timerStream(
      state.timer.inSeconds,
    ).listen((value) => add(TickPomodoro(value)));
  }

  void _onTick(TickPomodoro event, Emitter<PomodoroState> emit) {
    final isTimerCompleted =
        event.currentSeconds ==
        (state.isResting ? _restMinutes : _workDuration).inSeconds;

    emit(
      isTimerCompleted
          ? state.copyWith(
            isResting: !state.isResting,
            cycle: state.isResting ? _getNextCycle : state.cycle,
          )
          : state.copyWith(timer: Duration(seconds: event.currentSeconds)),
    );
  }

  void _onPaused(PausePomodoro event, Emitter<PomodoroState> emit) {
    _streamSubscription?.pause();
    emit(state.copyWith(isRunning: false));
  }

  Stream<int> _timerStream(int durationInSeconds) => Stream.periodic(
    const Duration(seconds: 1),
    (second) => second,
  ).take(durationInSeconds);
}
