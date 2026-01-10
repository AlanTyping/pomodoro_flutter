sealed class Failure {
  final String message;
  const Failure(this.message);
}

class DatabaseFailure extends Failure {
  const DatabaseFailure(super.message);
}

class TaskNotFoundFailure extends Failure {
  const TaskNotFoundFailure() : super('La tarea no existe');
}
