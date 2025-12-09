import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pomodoro_flutter/feature/task/data/usecases/use_cases.dart';

import '../repository/mock_task_repository.dart';
import '../task_mock.dart';

void main() {
  test("DeleteTaskUsecase llama a repository.deleteTask", () async {
    // establecemos mocks
    final repo = MockTaskRepository();
    // asignamos el repo mock al usecase
    final usecase = DeleteTaskUsecaseImpl(repo);

    //
    // cuando ejecutamos TaskRepoImpl(taskId) debe devolerse una void function
    when(() => repo.deleteTask(mockTaskId)).thenAnswer((_) async {});

    await usecase.execute(mockTaskId);

    verify(() => repo.deleteTask(mockTaskId)).called(1);
  });
}
