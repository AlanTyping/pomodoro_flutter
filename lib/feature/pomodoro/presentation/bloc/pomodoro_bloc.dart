import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:pomodoro_flutter/core/notifications/notification_api.dart';
import 'package:pomodoro_flutter/feature/pomodoro/presentation/bloc/pomodoro_state.dart';
import 'package:pomodoro_flutter/feature/task/domain/entities/task_entities.dart';
import 'package:pomodoro_flutter/feature/task/domain/usecases/insert_task_usecase.dart';

part 'pomodoro_event.dart';

final class PomodoroBloc extends Bloc<PomodoroEvent, PomodoroState> {
  static const Duration workDuration = Duration(minutes: 25);
  static const Duration restDuration = Duration(minutes: 5);

  StreamSubscription<int>? _streamSubscription;
  final InsertTaskUsecase _saveTaskUseCase =
      GetIt.instance.get<InsertTaskUsecase>();

  PomodoroBloc() : super(PomodoroState.initial()) {
    on<StartPomodoro>(_onStart);
    on<ResumePomodoro>(_onResumed);
    on<_TickPomodoro>(_onTick);
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
    final timer = state.isResting ? restDuration : workDuration;

    emit(state.copyWith(timer: timer, status: PomodoroStatus.running));

    LocalNotificationService.showNotification(
      id: 0,
      title: '¡Sesión iniciada!',
      body: 'Es momento de concentrarse.',
    );

    _streamSubscription?.cancel();

    _streamSubscription = _timerStream(
      timer,
    ).listen((value) => add(_TickPomodoro(value)));
  }

  void _onTick(_TickPomodoro event, Emitter<PomodoroState> emit) {
    emit(state.copyWith(timer: Duration(seconds: event.currentSeconds)));

    // Handle timer completion
    if (event.currentSeconds == 0) {
      if (state.cycle == Cycle.fourth && state.isResting) {
        add(StopPomodoro());
        return;
      }

      emit(
        state.copyWith(
          cycle: state.isResting ? _getNextCycle : state.cycle,
          isResting: !state.isResting,
          cyclesData: _updatedCycleData,
        ),
      );

      add(StartPomodoro());
    }
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
    emit(state.copyWith(cyclesData: _updatedCycleData));

    _streamSubscription?.cancel();
    LocalNotificationService.showNotification(
      id: 0,
      title: '¡Pomodoro completo!',
      body: 'Es momento de descansar.',
    );
    emit(state.copyWith(status: PomodoroStatus.done));
  }

  void _onSkipCycle(SkipCyclePomodoro event, Emitter<PomodoroState> emit) {
    emit(state.copyWith(cyclesData: _updatedCycleData));

    if (state.cycle != Cycle.fourth) {
      emit(state.copyWith(cycle: _getNextCycle, isResting: false));

      add(StartPomodoro());
      add(PausePomodoro());
    } else {
      add(StopPomodoro());
    }
  }

  void _onFinish(FinishPomodoro event, Emitter<PomodoroState> emit) async {
    final isCompleted = state.cyclesData.values.every(
      (secondsPerCycle) => secondsPerCycle >= workDuration.inSeconds,
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

  Map<Cycle, int> get _updatedCycleData {
    final newCycleData = Map<Cycle, int>.from(state.cyclesData)
      ..[state.cycle] =
          state.isResting
              ? (restDuration.inSeconds - state.timer.inSeconds) +
                  workDuration.inSeconds
              : (workDuration.inSeconds - state.timer.inSeconds);

    return newCycleData;
  }

  @override
  Future<void> close() {
    _streamSubscription?.cancel();
    return super.close();
  }
}
