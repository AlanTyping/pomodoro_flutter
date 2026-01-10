import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pomodoro_flutter/feature/task/data/usecases/use_cases.dart';

import '../../../../mocks/mock_task_repository.dart';
import '../task_mock.dart';

void main() {
  test("GetAllTasksUsecase calls repository.getAllTasks", () async {
    // arrange
    final repo = MockTaskRepository();
    final usecase = GetAllTasksUsecaseImpl(repo);
    when(() => repo.getAllTasks()).thenAnswer((_) async => [mockTask]);

    // act
    await usecase.execute();

    // assert
    verify(() => repo.getAllTasks()).called(1);
  });
}
