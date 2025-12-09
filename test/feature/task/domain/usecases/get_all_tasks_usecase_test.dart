import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pomodoro_flutter/feature/task/data/usecases/use_cases.dart';

import '../repository/mock_task_repository.dart';
import '../task_mock.dart';

void main() {
  test("GetAllTasksUsecase calls repository.getAllTasks", () async {
    final repo = MockTaskRepository();
    final usecase = GetAllTasksUsecaseImpl(repo);
    // cuando llamemos al mock repo, se devolverá un Future<List<Task>>
    when(() => repo.getAllTasks()).thenAnswer((_) async => [mockTask]);

    // llamamos
    await usecase.execute();

    // verificamos
    verify(() => repo.getAllTasks()).called(1);
  });
}
