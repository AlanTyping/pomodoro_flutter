import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pomodoro_flutter/feature/task/data/usecases/use_cases.dart';

import '../../../../mocks/mock_task_repository.dart';
import '../task_mock.dart';

void main() {
  test("UpdateTaskUsecase llama a repo.updateTask", () async {
    // arrange
    final repo = MockTaskRepository();
    final usecase = UpdateTaskUsecaseImpl(repo);
    when(() => repo.updateTask(mockTask)).thenAnswer((_) async {});

    // act
    await usecase.execute(mockTask);

    // assert
    verify(() => repo.updateTask(mockTask)).called(1);
  });
}
