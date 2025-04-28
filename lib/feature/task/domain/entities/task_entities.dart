enum Cycle { first, second, third, fourth }

class Task {
  final int? id;
  final String title;
  final DateTime date;
  final bool completed;
  final Map<Cycle, int> cyclesData;

  const Task({
    this.id,
    required this.title,
    required this.date,
    required this.completed,
    this.cyclesData = const {
      Cycle.first: 0,
      Cycle.second: 0,
      Cycle.third: 0,
      Cycle.fourth: 0,
    },
  });
}
