import '../entities/task_entities.dart';

abstract interface class InsertTaskUsecase {
  Future<void> execute(Task task);
}
