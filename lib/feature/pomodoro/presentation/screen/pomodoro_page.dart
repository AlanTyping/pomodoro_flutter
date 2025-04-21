import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pomodoro_flutter/feature/pomodoro/presentation/bloc/pomodoro_bloc.dart';
import 'package:pomodoro_flutter/feature/pomodoro/presentation/bloc/pomodoro_event.dart';
import 'package:pomodoro_flutter/feature/pomodoro/presentation/bloc/pomodoro_state.dart';
import 'package:pomodoro_flutter/feature/pomodoro/presentation/widgets/filling_box_animation.dart';
import 'package:pomodoro_flutter/feature/pomodoro/presentation/widgets/pomodoro_icon.dart';
import 'package:pomodoro_flutter/feature/pomodoro/presentation/widgets/timer_text.dart';
import 'package:pomodoro_flutter/feature/task/data/repository/task_repository_impl.dart';
import 'package:pomodoro_flutter/feature/task/data/usecases/sql_insert_task_usecase.dart';
import 'package:pomodoro_flutter/feature/task/domain/entities/task_entities.dart';

part './pomodoro_view.dart';

class PomodoroPage extends StatelessWidget {
  const PomodoroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => TaskRepositoryImpl(),
      child: BlocProvider(
        create:
            (context) => PomodoroBloc(
              insertUseCase: SqlInsertTaskUsecase(
                context.read<TaskRepositoryImpl>(),
              ),
            ),
        child: const _PomodoroView(),
      ),
    );
  }
}
