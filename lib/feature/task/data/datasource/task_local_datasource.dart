import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class SQLiteTaskLocalDatasource {
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
          db.execute(
            'CREATE TABLE taskTable(id INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT NOT NULL, date TEXT NOT NULL, completed INTEGER NOT NULL, cycle TEXT NOT NULL)',
          );
          deleteOldDatabases();
        },
        version: 1,
      );
    } catch (e) {
      throw Exception("ERROR al inicializar la base de datos: $e");
    }
  }

  //Elimina las bases de datos anteriores
  Future<void> deleteOldDatabases() async {
    for (int i = 1; i < dbVersion; i++) {
      String dbName = 'lista_${i}.db'; // Asegúrate de usar el nombre correcto
      await deleteDatabase(dbName);
    }
  }
}
