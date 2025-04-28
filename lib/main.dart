import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:pomodoro_flutter/core/theme/theme.dart';
import 'package:pomodoro_flutter/feature/pomodoro/presentation/screen/pomodoro_page.dart';
import 'package:pomodoro_flutter/feature/task/data/repository/task_repository_impl.dart';
import 'package:pomodoro_flutter/feature/task/data/usecases/use_cases.dart';
import 'package:pomodoro_flutter/feature/task/domain/repository/task_repository.dart';
import 'package:pomodoro_flutter/feature/task/domain/usecases/use_cases.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  _insertDependecies();

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    final brightness = View.of(context).platformDispatcher.platformBrightness;
    PomodoroTheme theme = PomodoroTheme(
      createTextTheme(context, 'Nokora', 'Alike'),
    );

    return MaterialApp(
      title: 'Pomodoro Flutter',
      theme: brightness == Brightness.dark ? theme.dark() : theme.light(),
      home: const PomodoroPage(),
    );
  }
}

void _insertDependecies() {
  GetIt.instance.registerSingleton<TaskRepository>(TaskRepositoryImpl());

  final taskRepo = GetIt.I.get<TaskRepository>();
  GetIt.instance.registerSingleton<GetAllTasksUsecase>(
    SqlGetAllTasksUsecase(taskRepo),
  );

  GetIt.instance.registerSingleton<DeleteTaskUsecase>(
    SqlDeleteTaskUsecase(taskRepo),
  );

  GetIt.instance.registerSingleton<InsertTaskUsecase>(
    SqlInsertTaskUsecase(taskRepo),
  );
}
