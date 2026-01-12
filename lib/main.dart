import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:pomodoro_flutter/app.dart';
import 'package:pomodoro_flutter/core/notifications/notification_api.dart';
import 'package:pomodoro_flutter/feature/task/data/datasource/task_local_datasource_impl.dart';
import 'package:pomodoro_flutter/feature/task/data/mappers/task_mapper.dart';
import 'package:pomodoro_flutter/feature/task/data/repository/task_repository_impl.dart';
import 'package:pomodoro_flutter/feature/task/domain/repository/task_repository.dart';
import 'package:pomodoro_flutter/feature/task/domain/usecases/delete_task.dart';
import 'package:pomodoro_flutter/feature/task/domain/usecases/get_all_tasks.dart';
import 'package:pomodoro_flutter/feature/task/domain/usecases/insert_task.dart';
import 'package:pomodoro_flutter/feature/task/domain/usecases/update_task.dart';
import 'package:pomodoro_flutter/feature/task_history/view/cubit/cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await LocalNotificationService.initialize();
  await _insertDependecies();

  runApp(const MainApp());
}

Future<void> _insertDependecies() async {
  final sl = GetIt.I;

  // cubit
  sl.registerLazySingleton<TaskHistoryCubit>(
    () => TaskHistoryCubit(sl(), sl(), sl(), sl()),
  );

  // Datasource
  sl.registerLazySingleton<SqfLiteTaskLocalDatasource>(
    () => SqfLiteTaskLocalDatasource(),
  );

  // Mapper
  sl.registerLazySingleton<TaskMapper>(() => TaskMapper());

  // Repository
  sl.registerFactory<TaskRepository>(
    () => TaskRepositoryImpl(
      sl<SqfLiteTaskLocalDatasource>(),
      mapper: sl<TaskMapper>(),
    ),
  );

  // Usecases
  sl.registerFactory<GetAllTasks>(() => GetAllTasks(sl<TaskRepository>()));
  sl.registerFactory<DeleteTask>(() => DeleteTask(sl<TaskRepository>()));
  sl.registerFactory<InsertTask>(() => InsertTask(sl<TaskRepository>()));
  sl.registerFactory<GetAllTasks>(() => GetAllTasks(sl<TaskRepository>()));
  sl.registerFactory<UpdateTask>(() => UpdateTask(sl<TaskRepository>()));

  // SharedPreferences
  final prefs = await SharedPreferences.getInstance();
  sl.registerSingleton<SharedPreferences>(prefs);
}
