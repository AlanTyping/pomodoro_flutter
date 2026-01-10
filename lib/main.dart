import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:pomodoro_flutter/app.dart';
import 'package:pomodoro_flutter/core/notifications/notification_api.dart';
import 'package:pomodoro_flutter/feature/task/data/datasource/task_local_datasource_impl.dart';
import 'package:pomodoro_flutter/feature/task/data/mappers/task_mapper.dart';
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
  final sl = GetIt.I;

  // Datasource
  sl.registerLazySingleton<SqfLiteTaskLocalDatasource>(
    () => SqfLiteTaskLocalDatasource(),
  );

  // Mapper
  sl.registerLazySingleton<TaskMapper>(() => TaskMapper());

  // Repository
  sl.registerLazySingleton<TaskRepository>(
    () => TaskRepositoryImpl(
      sl<SqfLiteTaskLocalDatasource>(),
      mapper: sl<TaskMapper>(),
    ),
  );

  // Usecases
  sl.registerLazySingleton<GetAllTasksUsecase>(
    () => GetAllTasks(sl<TaskRepository>()),
  );

  sl.registerLazySingleton<DeleteTaskUsecase>(
    () => DeleteTask(sl<TaskRepository>()),
  );

  sl.registerLazySingleton<InsertTaskUsecase>(
    () => InsertTask(sl<TaskRepository>()),
  );

  // SharedPreferences
  final prefs = await SharedPreferences.getInstance();
  sl.registerSingleton<SharedPreferences>(prefs);
}
