enum Cycle { first, second, third, fourth }

class Task {
  final int? id;
  final String title;
  final DateTime date;
  final bool completed;
  final Cycle cycle;

  const Task({
    this.id,
    required this.title,
    required this.date,
    required this.completed,
    required this.cycle,
  });
}
