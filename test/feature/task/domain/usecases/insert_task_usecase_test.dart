import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pomodoro_flutter/feature/task/data/usecases/insert_task_usecase_impl.dart';
import '../repository/mock_task_repository.dart';
import '../task_mock.dart';

void main() {
  test("InsertTaskUsecase llama a repository.insertTask", () async {
    final repo = MockTaskRepository();
    final usecase = InsertTaskUsecaseImpl(repo);

    // cuando ejecutamos el repo, responder:
    when(() => repo.insertTask(mockTask)).thenAnswer((_) async {});

    // ejecutamos el repo
    await usecase.execute(mockTask);

    // verificamos repo.insertTask se haya llamado una vez
    verify(() => repo.insertTask(mockTask)).called(1);
  });
}
