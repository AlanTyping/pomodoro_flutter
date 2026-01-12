import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pomodoro_flutter/core/usercase.dart';
import 'package:pomodoro_flutter/feature/task/domain/usecases/get_all_tasks.dart';

import '../../../../mocks/mock_task_repository.dart';
import '../task_mock.dart';

void main() {
  test("GetAllTasksUsecase calls repository.getAllTasks", () async {
    // arrange
    final repo = MockTaskRepository();
    final usecase = GetAllTasks(repo);
    when(() => repo.getAllTasks()).thenAnswer((_) async => right([mockTask]));

    // act
    await usecase(NoParams());

    // assert
    verify(() => repo.getAllTasks()).called(1);
  });
}
