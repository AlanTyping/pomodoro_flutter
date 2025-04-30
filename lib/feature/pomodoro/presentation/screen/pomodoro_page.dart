import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pomodoro_flutter/feature/pomodoro/presentation/bloc/pomodoro_bloc.dart';
import 'package:pomodoro_flutter/feature/pomodoro/presentation/bloc/pomodoro_event.dart';
import 'package:pomodoro_flutter/feature/pomodoro/presentation/bloc/pomodoro_state.dart';
import 'package:pomodoro_flutter/feature/task_history/view/task_history_page.dart';

part './pomodoro_view.dart';
part '../widgets/action_buttons.dart';
part '../widgets/filling_box_animation.dart';

class PomodoroPage extends StatelessWidget {
  const PomodoroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PomodoroBloc(),
      child: const _PomodoroView(),
    );
  }
}
