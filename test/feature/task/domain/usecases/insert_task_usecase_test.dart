import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pomodoro_flutter/feature/task/data/usecases/insert_task_usecase_impl.dart';

import '../../../../mocks/mock_task_repository.dart';
import '../task_mock.dart';

void main() {
  test("InsertTaskUsecase llama a repository.insertTask", () async {
    // arrange
    final repo = MockTaskRepository();
    final usecase = InsertTaskUsecaseImpl(repo);
    when(() => repo.insertTask(mockTask)).thenAnswer((_) async {});

    // act
    await usecase.execute(mockTask);

    // assert
    verify(() => repo.insertTask(mockTask)).called(1);
  });
}
