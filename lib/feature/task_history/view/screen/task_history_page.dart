import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:pomodoro_flutter/feature/task/domain/entities/task_entities.dart';
import 'package:pomodoro_flutter/feature/task_history/view/widgets/cycle-progress-bar.dart';

import '../cubit/cubit.dart';

part 'task_history_view.dart';

final class TaskHistoryPage extends StatelessWidget {
  static Route route() => PageRouteBuilder(
    pageBuilder: (context, animation, secondAnimation) => TaskHistoryPage(),
  );

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TaskHistoryCubit(),
      child: _TaskHistoryView(),
    );
  }
}
