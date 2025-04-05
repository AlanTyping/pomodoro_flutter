import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pomodoro_flutter/feature/pomodoro/presentation/providers/pomodoro_cubit.dart';
import 'package:pomodoro_flutter/feature/pomodoro/presentation/providers/pomodoro_state.dart';

part 'pomodoro_view.dart';

class PomodoroPage extends StatelessWidget {
  const PomodoroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PomodoroCubit(),
      child: _PomodoroView(),
    );
  }
}
