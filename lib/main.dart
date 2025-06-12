import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:pomodoro_flutter/app.dart';
import 'package:pomodoro_flutter/core/notifications/notification_api.dart';
import 'package:pomodoro_flutter/feature/task/data/repository/task_repository_impl.dart';
import 'package:pomodoro_flutter/feature/task/data/usecases/use_cases.dart';
import 'package:pomodoro_flutter/feature/task/domain/repository/task_repository.dart';
import 'package:pomodoro_flutter/feature/task/domain/usecases/use_cases.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await LocalNotificationService.initialize();
  await _insertDependecies();

  runApp(const MainApp());
}

Future<void> _insertDependecies() async {
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

  // SharedPreferences
  final prefs = await SharedPreferences.getInstance();

  GetIt.instance.registerSingleton<SharedPreferences>(prefs);
}
