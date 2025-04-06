import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pomodoro_flutter/feature/pomodoro/presentation/bloc/pomodoro_bloc.dart';
import 'package:pomodoro_flutter/feature/pomodoro/presentation/widgets/timer_text.dart';

import '../bloc/pomodoro_state.dart';
import '../bloc/pomodoro_event.dart';

part 'pomodoro_view.dart';

class PomodoroPage extends StatelessWidget {
  const PomodoroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PomodoroBloc(),
      child: _PomodoroView(),
    );
  }
}
