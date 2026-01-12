import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pomodoro_flutter/feature/task/domain/usecases/delete_task.dart';

import '../../../../mocks/mock_task_repository.dart';
import '../task_mock.dart';

void main() {
  test("DeleteTaskUsecase llama a repository.deleteTask", () async {
    // arrange
    final repo = MockTaskRepository();
    final usecase = DeleteTask(repo);
    when(
      () => repo.deleteTask(mockTaskId),
    ).thenAnswer((_) async => right(unit));

    // act
    await usecase(DeleteParams(mockTaskId));

    // assert
    verify(() => repo.deleteTask(mockTaskId)).called(1);
  });
}
