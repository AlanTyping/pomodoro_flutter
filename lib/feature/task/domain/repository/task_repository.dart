import '../entities/task_entities.dart';

// Clase abstracta con el objetivo de solo mencionar las acciones, sin ninguna implementacion
abstract interface class TaskRepository {
  Future<void> insertTask(Task task);
  Future<void> updateTask(Task task);
  Future<void> deleteTask(int id);
  Future<List<Task>> getAllTasks();
}
