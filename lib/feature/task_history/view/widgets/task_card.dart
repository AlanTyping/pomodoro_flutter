part of '../screen/task_history_page.dart';

class _TaskCard extends StatelessWidget {
  const _TaskCard({required this.task, required this.onDelete});

  final Task task;
  final VoidCallback onDelete;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    final dateFormat = DateFormat('dd/MM/yyyy');

    final cycles = Cycle.values;
    final percentages = Map.fromEntries(
      cycles.map(
        (ciclo) =>
            MapEntry(ciclo, (task.cyclesData[ciclo]! / 1500).clamp(0.0, 1.0)),
      ),
    );

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          spacing: 8,
          mainAxisSize: MainAxisSize.min,
          children: [
            _TaskStatusHeader(
              isCompleted: task.completed,
              taskTitle: task.title,
              onDelete: onDelete,
              textTheme: textTheme,
              colorScheme: colorScheme,
            ),
            _TaskTitleAndDate(
              title: task.title,
              date: task.date,
              textTheme: textTheme,
              dateFormat: dateFormat,
            ),
            _CycleProgressIndicators(percentages: percentages),
          ],
        ),
      ),
    );
  }
}

class _TaskStatusHeader extends StatelessWidget {
  const _TaskStatusHeader({
    required this.isCompleted,
    required this.taskTitle,
    required this.onDelete,
    required this.textTheme,
    required this.colorScheme,
  });

  final bool isCompleted;
  final String taskTitle;
  final VoidCallback onDelete;
  final TextTheme textTheme;
  final ColorScheme colorScheme;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Expanded(
          child:
              isCompleted
                  ? Text(
                    'Completado',
                    style: textTheme.titleMedium?.copyWith(
                      color: Colors.greenAccent,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                  : Text(
                    'Incompleto',
                    style: textTheme.titleSmall?.copyWith(
                      color: colorScheme.error,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
        ),
        IconButton(
          onPressed: () {
            showDialog(
              context: context,
              builder:
                  (context) => AlertDialog.adaptive(
                    title: Text('Desear borrar esta tarea $taskTitle?'),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.of(context).pop(),
                        child: const Text('Cancelar'),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                          onDelete();
                        },
                        child: const Text('Eliminar'),
                      ),
                    ],
                  ),
            );
          },
          icon: Icon(Icons.delete, color: colorScheme.error),
        ),
      ],
    );
  }
}

class _TaskTitleAndDate extends StatelessWidget {
  const _TaskTitleAndDate({
    required this.title,
    required this.date,
    required this.textTheme,
    required this.dateFormat,
  });

  final String title;
  final DateTime date;
  final TextTheme textTheme;
  final DateFormat dateFormat;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            title,
            overflow: TextOverflow.ellipsis,
            softWrap: true,
            maxLines: 2,
            style: textTheme.bodyLarge,
          ),
        ),
        Text(dateFormat.format(date), style: textTheme.bodyLarge),
      ],
    );
  }
}

class _CycleProgressIndicators extends StatelessWidget {
  const _CycleProgressIndicators({required this.percentages});

  final Map<Cycle, double> percentages;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Row(
        spacing: 4,
        children:
            Cycle.values
                .map(
                  (cycle) => Expanded(
                    child: CycleProgressBar(percentage: percentages[cycle]),
                  ),
                )
                .toList(),
      ),
    );
  }
}
