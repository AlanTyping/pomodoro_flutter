import 'package:pomodoro_flutter/feature/task/data/datasource/task_local_datasource.dart';
import 'package:pomodoro_flutter/feature/task/data/mappers/task_mapper.dart';
import 'package:pomodoro_flutter/feature/task/data/models/task_model.dart';
import 'package:pomodoro_flutter/feature/task/domain/entities/task_entities.dart'
    show Task;
import 'package:pomodoro_flutter/feature/task/domain/repository/task_repository.dart';
import 'package:sqflite/sqflite.dart';

class TaskRepositoryImpl implements TaskRepository {
  //Instancia a la base de datos
  final SQLiteTaskLocalDatasource localDatasource = SQLiteTaskLocalDatasource();

  //en una variable manejamos la instancia de la inicializacion
  Future<Database> get _database async => await localDatasource.getDataBase();

  static const taskTableName = 'taskTable';

  @override
  Future<List<Task>> getAllTasks() async {
    final db = await _database;

    final List<Map<String, dynamic>> queryResult = await db.rawQuery(
      'SELECT * FROM $taskTableName',
    );

    final listModels =
        queryResult
            .map((objectJson) => TaskModel.fromJson(objectJson))
            .toList();

    return TaskMapper().fromListModel(listModels);
  }

  @override
  Future<void> insertTask(Task task) async {
    final db = await _database;

    final data = TaskMapper().fromTask(task);

    await db.insert(taskTableName, data.toJson());
  }

  @override
  Future<void> updateTask(Task task) async {
    final db = await _database;

    final data = TaskMapper().fromTask(task);

    await db.update(
      taskTableName,
      data.toJson(),
      where: 'id = ?',
      whereArgs: [data.id],
    );
  }

  @override
  Future<void> deleteTask(int id) async {
    final db = await _database;
    await db.delete(taskTableName, where: 'id = ?', whereArgs: [id]);
  }
}
