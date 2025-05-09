part of '../screen/task_history_page.dart';
class _TaskListView extends StatelessWidget {
  const _TaskListView({
    required this.tasks,
    required this.onDeleteTask,
  });

  final Iterable<Task> tasks;
  final Function(Task) onDeleteTask;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.all(8),
      separatorBuilder: (context, index) => const SizedBox(height: 16),
      itemCount: tasks.length,
      itemBuilder: (context, index) {
        final task = tasks.elementAt(index);
        return _TaskCard(
          task: task,
          onDelete: () => onDeleteTask(task),
        );
      },
    );
  }
}