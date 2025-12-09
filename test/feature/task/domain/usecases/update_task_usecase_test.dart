import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pomodoro_flutter/feature/task/data/usecases/use_cases.dart';

import '../repository/mock_task_repository.dart';
import '../task_mock.dart';

void main() {
  test("UpdateTaskUsecase llama a repo.updateTask", () async {
    // Establecemos mocks y usecase
    final repo = MockTaskRepository();
    final usecase = UpdateTaskUsecaseImpl(repo);

    // cuando pase x, responder y
    when(() => repo.updateTask(mockTask)).thenAnswer((_) async {});

    // Ejecutar usecase
    await usecase.execute(mockTask);

    // Verificar resultado
    verify(() => repo.updateTask(mockTask)).called(1);
  });
}
