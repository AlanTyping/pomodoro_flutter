import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pomodoro_flutter/core/failure.dart';
import 'package:pomodoro_flutter/feature/task/data/repository/task_repository_impl.dart';
import '../../../../mocks/database_mock.dart';
import '../../../../mocks/mapper_mock.dart';
import '../../../../mocks/sqflite_task_local_datasource_mock.dart';
import '../../../../mocks/task_mosks.dart';

void main() {
  late SqfliteTaskLocalDatasourceMock localDatasource;
  late DatabaseMock db;
  late TaskRepositoryImpl repo;
  late TaskMapperMock mapperMock;

  setUp(() {
    localDatasource = SqfliteTaskLocalDatasourceMock();
    db = DatabaseMock();

    when(() => localDatasource.getDataBase()).thenAnswer((_) async => db);

    // mapper
    mapperMock = TaskMapperMock();

    when(
      () => mapperMock.fromJsonList(taskJsonListMock),
    ).thenReturn(taskModelListMock);
    when(
      () => mapperMock.fromListModel(taskModelListMock),
    ).thenReturn(taskListMock);
    when(() => mapperMock.fromTask(taskMock)).thenReturn(taskModelMock);

    repo = TaskRepositoryImpl(localDatasource, mapper: mapperMock);
  });

  group("task repository", () {
    test("when getAllTasks is called, it should return List<Task>", () async {
      // arrange
      when(
        () => localDatasource.getAllTasksJson(),
      ).thenAnswer((_) async => taskJsonListMock);

      // act
      final result = await repo.getAllTasks();

      // assert
      expect(result, equals(right(taskListMock)));
      verify(() => localDatasource.getAllTasksJson()).called(1);
      verify(() => repo.mapper.fromJsonList(taskJsonListMock)).called(1);
      verify(() => repo.mapper.fromListModel(taskModelListMock)).called(1);
    });

    test("when deleteTask is called, it should delete Task", () async {
      // arrange
      when(() => localDatasource.deleteTask(123)).thenAnswer((_) async => 1);
      // act
      final result = await repo.deleteTask(123);
      // assert
      expect(result, right(unit));
    });
  });

  group("task repository exceptions", () {
    test("when deleteTask is called, it should return an exception", () async {
      // arrange
      when(() => localDatasource.deleteTask(123)).thenAnswer((_) async => 0);
      // act
      final result = await repo.deleteTask(123);
      // assert
      expect(
        result,
        left(const DatabaseFailure('No se encontró la tarea a eliminar')),
      );
    });
  });
}
