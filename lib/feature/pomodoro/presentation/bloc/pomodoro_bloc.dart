import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:pomodoro_flutter/feature/pomodoro/presentation/bloc/pomodoro_event.dart';
import 'package:pomodoro_flutter/feature/pomodoro/presentation/bloc/pomodoro_state.dart';
import 'package:pomodoro_flutter/feature/task/domain/entities/task_entities.dart';
import 'package:pomodoro_flutter/feature/task/domain/usecases/insert_task_usecase.dart';

final class PomodoroBloc extends Bloc<PomodoroEvent, PomodoroState> {
  static const Duration _workDuration = Duration(minutes: 25);
  static const Duration _restDuration = Duration(minutes: 5);

  StreamSubscription<int>? _streamSubscription;
  final InsertTaskUsecase _saveTaskUseCase =
      GetIt.instance.get<InsertTaskUsecase>();

  PomodoroBloc() : super(PomodoroState.initial()) {
    on<StartPomodoro>(_onStart);
    on<ResumePomodoro>(_onResumed);
    on<TickPomodoro>(_onTick);
    on<PausePomodoro>(_onPaused);
    on<StopPomodoro>(_onStop);
    on<SkipCyclePomodoro>(_onSkipCycle);
    on<UpdateTitlePomodoro>(
      (event, emit) => emit(state.copyWith(title: event.title)),
    );
    on<FinishPomodoro>(_onFinish); // Add this in constructor
  }

  Cycle get _getNextCycle {
    final nextOrdinal = (state.cycle.index + 1) % 4;
    return Cycle.values[nextOrdinal];
  }

  void _onStart(StartPomodoro event, Emitter<PomodoroState> emit) {
    final timer = state.isResting ? _restDuration : _workDuration;

    emit(state.copyWith(timer: timer, status: PomodoroStatus.running));

    _streamSubscription?.cancel();

    _streamSubscription = _timerStream(
      timer,
    ).listen((value) => add(TickPomodoro(value)));
  }

  void _onTick(TickPomodoro event, Emitter<PomodoroState> emit) {
    final isResting = state.isResting;
    final currentDurationInSeconds =
        (isResting ? _restDuration : _workDuration).inSeconds;

    if (event.currentSeconds == currentDurationInSeconds) {
      add(
        state.cycle == Cycle.fourth
            ? const FinishPomodoro()
            : const SkipCyclePomodoro(),
      );
      return;
    }

    emit(state.copyWith(timer: Duration(seconds: event.currentSeconds)));
  }

  void _onPaused(PausePomodoro event, Emitter<PomodoroState> emit) {
    _streamSubscription?.pause();

    emit(state.copyWith(status: PomodoroStatus.pause));
  }

  void _onResumed(ResumePomodoro event, Emitter<PomodoroState> emit) {
    _streamSubscription?.resume();
    emit(state.copyWith(status: PomodoroStatus.running));
  }

  void _onStop(StopPomodoro event, Emitter<PomodoroState> emit) async {
    _streamSubscription?.cancel();
    emit(state.copyWith(status: PomodoroStatus.done));
  }

  void _onSkipCycle(SkipCyclePomodoro event, Emitter<PomodoroState> emit) {
    final newCycleData = Map<Cycle, int>.from(state.cyclesData)
      ..[state.cycle] =
          state.isResting
              ? (_restDuration.inSeconds - state.timer.inSeconds) +
                  _workDuration.inSeconds
              : (_workDuration.inSeconds - state.timer.inSeconds);

    emit(state.copyWith(cyclesData: newCycleData));

    if (state.cycle != Cycle.fourth) {
      emit(state.copyWith(cycle: _getNextCycle, isResting: false));

      add(const StartPomodoro());
      add(const PausePomodoro());
    } else {
      add(const StopPomodoro());
    }
  }

  void _onFinish(FinishPomodoro event, Emitter<PomodoroState> emit) async {
    final isCompleted = state.cyclesData.values.every(
      (secondsPerCycle) => secondsPerCycle >= _workDuration.inSeconds,
    );

    final registeredTask = Task(
      title: state.title ?? 'Null',
      date: DateTime.now(),
      completed: isCompleted,
      cyclesData: state.cyclesData,
    );

    await _saveTaskUseCase.execute(registeredTask);

    emit(PomodoroState.initial());
  }

  Stream<int> _timerStream(Duration duration) {
    return Stream.periodic(
      const Duration(seconds: 1),
      (tick) => duration.inSeconds - tick - 1,
    ).takeWhile((seconds) => seconds >= 0);
  }

  @override
  Future<void> close() {
    _streamSubscription?.cancel();
    return super.close();
  }
}
