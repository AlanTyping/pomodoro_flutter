import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:pomodoro_flutter/feature/pomodoro/presentation/screen/pomodoro_page.dart';
import 'package:pomodoro_flutter/feature/task/data/repository/task_repository_impl.dart';
import 'package:pomodoro_flutter/feature/task/data/usecases/sql_delete_task_usecase.dart';
import 'package:pomodoro_flutter/feature/task/data/usecases/sql_get_all_tasks_usecase.dart';
import 'package:pomodoro_flutter/feature/task/data/usecases/sql_insert_task_usecase.dart';
import 'package:pomodoro_flutter/feature/task/domain/repository/task_repository.dart';
import 'package:pomodoro_flutter/feature/task/domain/usecases/delete_task_usecase.dart';
import 'package:pomodoro_flutter/feature/task/domain/usecases/get_all_tasks_usecase.dart';
import 'package:pomodoro_flutter/feature/task/domain/usecases/insert_task_usecase.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  _insertDependecies();

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pomodoro Flutter',
      theme: ThemeData.from(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
      ),
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
