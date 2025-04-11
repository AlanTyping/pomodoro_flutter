import 'package:pomodoro_flutter/feature/task/data/datasource/task_local_datasource.dart';
import 'package:pomodoro_flutter/feature/task/data/models/task_model.dart';
import 'package:pomodoro_flutter/feature/task/domain/repository/task_repository.dart';
import 'package:sqflite/sqflite.dart';

class TaskRepositoryImpl implements TaskRepository {
  //Instancia a la base de datos
  final SQLiteTaskLocalDatasource localDatasource = SQLiteTaskLocalDatasource();

  //en una variable manejamos la instancia de la inicializacion
  Future<Database> get _database async => await localDatasource.getDataBase();


  @override
  Future<List<TaskModel>> getAllTasks() async {
    final db = await _database;
    final List<Map<String, dynamic>> queryResult = await db.rawQuery('SELECT * FROM taskTable');
    return queryResult.map((e) => TaskModel.fromJson(e)).toList();
  }

  @override
  Future<void> insertTask(TaskModel data) async{
    final db = await _database;
    await db.insert('ListaTable', data.toJson());
  }

  @override
  Future<void> updateTask(TaskModel data)async{
    final db = await _database;
    await db.update(
      'taskTable',
      data.toJson(),
      where: 'id = ?',
      whereArgs: [data.id],
    );
  }

  @override
  Future<void> deleteTask(int id)async{
    final db = await _database;
    await db.delete('taskTable', where: 'id = ?', whereArgs: [id]);
  }
}
