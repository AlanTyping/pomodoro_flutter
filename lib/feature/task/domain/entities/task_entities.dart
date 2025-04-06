class Task {
  final int? id;
  final String title;
  final DateTime date;
  final bool completed;
  final Cycle cycle;

  Task({
    this.id,
    required this.title,
    required this.date,
    required this.completed,
    required this.cycle
  });
}

enum Cycle { first, second, third, fourth }
