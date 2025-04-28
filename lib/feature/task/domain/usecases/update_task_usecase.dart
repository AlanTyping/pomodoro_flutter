import '../entities/task_entities.dart';

abstract interface class UpdateTaskUsecase {
  Future<void> execute(Task task);
}
