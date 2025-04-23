part of 'task_history_page.dart';

final class _TaskHistoryView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocBuilder<TaskHistoryCubit, TaskHistoryState>(
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          return ListView.builder(
            itemCount: state.tasks.length,
            itemBuilder: (context, index) {
              final task = state.tasks.elementAt(
                // mostrar el último elemento primero, y así sucesivamente.
                state.tasks.length - index - 1,
              );

              return ListTile(
                leading: Icon(
                  task.completed ? Icons.check : Icons.close,
                  color: task.completed ? Colors.green : Colors.red,
                ),
                title: Text(task.title),
                subtitle: Text(task.cyclesData.toString()),
                trailing: IconButton(
                  icon: const Icon(
                    Icons.delete,
                    color: Color.fromARGB(255, 179, 59, 59),
                  ),
                  onPressed: () {
                    context.read<TaskHistoryCubit>().deleteTask(task.id!);
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}
