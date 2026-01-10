import 'package:pomodoro_flutter/feature/task/data/datasource/task_local_datasource.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class SqfLiteTaskLocalDatasource implements TaskLocalDatasource {
  Database? _database;
  int dbVersion = 1;

  //INICIALIZAR LA BASE DE DATOS
  Future<Database> getDataBase() async {
    if (_database != null) return _database!;
    _database = await initDB();
    return _database!;
  }

  //CREACION DE LA BASE DE DATOS
  Future<Database> initDB() async {
    try {
      String path = await getDatabasesPath();
      return openDatabase(
        join(path, 'task_$dbVersion.db'),
        onCreate: (db, version) {
          db.execute('''CREATE TABLE taskTable(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            title TEXT NOT NULL,
            date TEXT NOT NULL,
            secondsFirstCycle int DEFAULT(0),
            secondsSecondCycle int DEFAULT(0),
            secondsThirdCycle int DEFAULT(0),
            secondsFourthCycle int DEFAULT(0)
            )''');

          deleteOldDatabases();
        },
        version: 1,
      );
    } catch (e) {
      throw Exception('ERROR al inicializar la base de datos: $e');
    }
  }

  //Elimina las bases de datos anteriores
  Future<void> deleteOldDatabases() async {
    for (int i = 1; i < dbVersion; i++) {
      String dbName = 'lista_$i.db'; // Asegúrate de usar el nombre correcto
      await deleteDatabase(dbName);
    }
  }

  // ---------------------------------------------------------
  // 🔥 **Añadiendo consultas a datasource en vez de repository**
  // ---------------------------------------------------------

  static const taskTableName = 'taskTable';
  @override
  /// Obtener todas las tareas crudas en JSON
  Future<List<Map<String, dynamic>>> getAllTasksJson() async {
    final db = await getDataBase();
    return await db.rawQuery('SELECT * FROM $taskTableName');
  }

  @override
  /// Insertar una tarea
  Future<int> insertTask(Map<String, dynamic> json) async {
    final db = await getDataBase();
    return await db.insert(
      taskTableName,
      json,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  @override
  /// Eliminar por ID
  Future<int> deleteTask(int id) async {
    final db = await getDataBase();
    return await db.delete(taskTableName, where: 'id = ?', whereArgs: [id]);
  }

  @override
  // Actualizar
  Future<int> updateTask(Map<String, dynamic> jsonTask) async {
    final db = await getDataBase();

    return await db.update(
      taskTableName,
      jsonTask,
      where: 'id = ?',
      whereArgs: [jsonTask['id']],
    );
  }
}
