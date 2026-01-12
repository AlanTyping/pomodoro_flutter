import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pomodoro_flutter/feature/task/domain/usecases/update_task.dart';

import '../../../../mocks/mock_task_repository.dart';
import '../task_mock.dart';

void main() {
  test("UpdateTaskUsecase llama a repo.updateTask", () async {
    // arrange
    final repo = MockTaskRepository();
    final usecase = UpdateTask(repo);
    when(() => repo.updateTask(mockTask)).thenAnswer((_) async => right(unit));

    // act
    await usecase(UpdateTaskParams(mockTask));

    // assert
    verify(() => repo.updateTask(mockTask)).called(1);
  });
}
