import 'package:pomodoro_flutter/feature/task/data/models/task_model.dart';

//Clase abstracta con el objetivo de solo mencionar las acciones, sin ninguna implementacion
abstract class TaskRepository {
  Future<void> insertTask(TaskModel data);
  Future<void> updateTask(TaskModel data);
  Future<void> deleteTask(int id);
  Future<List<TaskModel>> getAllTasks();
}
