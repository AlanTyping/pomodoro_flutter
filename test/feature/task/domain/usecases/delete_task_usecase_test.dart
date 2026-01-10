import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pomodoro_flutter/feature/task/data/usecases/use_cases.dart';

import '../../../../mocks/mock_task_repository.dart';
import '../task_mock.dart';

void main() {
  test("DeleteTaskUsecase llama a repository.deleteTask", () async {
    // arrange
    final repo = MockTaskRepository();
    final usecase = DeleteTaskUsecaseImpl(repo);
    when(() => repo.deleteTask(mockTaskId)).thenAnswer((_) async => 1);

    // act
    await usecase.execute(mockTaskId);

    // assert
    verify(() => repo.deleteTask(mockTaskId)).called(1);
  });
}
