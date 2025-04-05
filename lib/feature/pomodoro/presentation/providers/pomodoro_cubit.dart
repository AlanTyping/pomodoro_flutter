import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pomodoro_flutter/feature/task/domain/entities/task_entities.dart';
import 'cubit.dart';

final class PomodoroCubit extends Cubit<PomodoroState> {
  PomodoroCubit() : super(PomodoroInitialState());

  void onTitleChanged() {}

  void onStart() {
    emit(
      PomodoroRunningState(
        currentSeconds: 0,
        task: Task(
          title: "A",
          date: DateTime.now(),
          cycle: Cycle.first,
          completed: false,
        ),
      ),
    );
  }

  void onPaused() {}
  void onCancel() {}
  void onSkipCycle() {}
  void onFinish() {}
}
