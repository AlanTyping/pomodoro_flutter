import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:pomodoro_flutter/feature/task/domain/entities/task_entities.dart';
import 'package:pomodoro_flutter/feature/task_history/view/widgets/cycle_progress_bar.dart';
import 'package:pomodoro_flutter/l10n/l10n.dart';

import '../cubit/cubit.dart';

part 'task_history_view.dart';
part '../widgets/name_filter_field.dart';
part '../widgets/task_list_view.dart';
part '../widgets/task_card.dart';

final class TaskHistoryPage extends StatelessWidget {
  static Route route() => PageRouteBuilder(
    pageBuilder: (context, animation, secondAnimation) => TaskHistoryPage(),
  );

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TaskHistoryCubit(),
      child: const _TaskHistoryView(),
    );
  }
}
