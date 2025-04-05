class Task {
  final int? id;
  final String title;
  final DateTime date;
  final bool status;
  final Cycle cycle;

  Task({
    this.id,
    required this.title,
    required this.date,
    required this.status,
    required this.cycle
  });
}

enum Cycle { first, second, third, fourth }
