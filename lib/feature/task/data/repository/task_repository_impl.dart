import 'package:fpdart/fpdart.dart';
import 'package:pomodoro_flutter/core/failure.dart';
import 'package:pomodoro_flutter/feature/task/data/datasource/task_local_datasource_impl.dart';
import 'package:pomodoro_flutter/feature/task/data/mappers/task_mapper.dart';
import 'package:pomodoro_flutter/feature/task/domain/entities/task_entities.dart';
import 'package:pomodoro_flutter/feature/task/domain/repository/task_repository.dart';

class TaskRepositoryImpl implements TaskRepository {
  final SqfLiteTaskLocalDatasource localDatasource;
  final TaskMapper mapper;
  const TaskRepositoryImpl(this.localDatasource, {required this.mapper});

  @override
  Future<Either<DatabaseFailure, List<TaskEntity>>> getAllTasks() async {
    try {
      final queryResult = await localDatasource.getAllTasksJson();
      final listModels = mapper.fromJsonList(queryResult);

      return right(mapper.fromListModel(listModels));
    } catch (e) {
      return left(DatabaseFailure(e.toString()));
    }
  }

  @override
  Future<Either<DatabaseFailure, int>> insertTask(TaskEntity task) async {
    try {
      final data = mapper.fromTask(task);

      final result = await localDatasource.insertTask(data.toJson());

      if (result == 0) {
        return left(
          const DatabaseFailure('No se pudo insertar la tarea correctamente'),
        );
      }

      return right(result);
    } catch (e) {
      return left(DatabaseFailure(e.toString()));
    }
  }

  @override
  Future<Either<DatabaseFailure, Unit>> updateTask(TaskEntity task) async {
    try {
      final data = mapper.fromTask(task);
      final result = await localDatasource.updateTask(data.toJson());

      if (result == 0) {
        return left(
          const DatabaseFailure('No se encontró la tarea a actualizar!'),
        );
      }
      return right(unit);
    } catch (e) {
      return left(DatabaseFailure(e.toString()));
    }
  }

  @override
  Future<Either<DatabaseFailure, Unit>> deleteTask(int id) async {
    try {
      final result = await localDatasource.deleteTask(id);

      if (result == 0) {
        return left(
          const DatabaseFailure('No se encontró la tarea a eliminar'),
        );
      }

      return right(unit);
    } catch (e) {
      return left(DatabaseFailure(e.toString()));
    }
  }
}
