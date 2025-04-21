part of 'task_history_page.dart';

final class _TaskHistoryView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<TaskHistoryCubit, TaskHistoryState>(
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          return ListView.builder(
            itemCount: state.tasks.length,
            itemBuilder: (context, index) {
              final task = state.tasks.elementAt(index);

              return ListTile(
                title: Text(task.title),
                subtitle: Text(task.cyclesData.toString()),
                trailing: Text(task.completed ? 'Check' : 'No Check'),
              );
            },
          );
        },
      ),
    );
  }
}
