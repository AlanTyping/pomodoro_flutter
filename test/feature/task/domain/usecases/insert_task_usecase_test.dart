import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pomodoro_flutter/feature/task/domain/usecases/insert_task.dart';

import '../../../../mocks/mock_task_repository.dart';
import '../task_mock.dart';

void main() {
  test("InsertTaskUsecase llama a repository.insertTask", () async {
    // arrange
    final repo = MockTaskRepository();
    final usecase = InsertTask(repo);
    when(() => repo.insertTask(mockTask)).thenAnswer((_) async => right(1));

    // act
    await usecase(InsertTaskParams(mockTask));

    // assert
    verify(() => repo.insertTask(mockTask)).called(1);
  });
}
