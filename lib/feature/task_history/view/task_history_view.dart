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

          return Padding(
            padding: const EdgeInsets.all(12),
            child: ListView.separated(
              itemCount: state.tasks.length,
              separatorBuilder:
                  (context, index) =>
                      const SizedBox(height: 16), // 👈 Espacio entre ítems
              itemBuilder: (context, index) {
                final task = state.tasks.elementAt(
                  state.tasks.length - index - 1,
                );

                final ciclos = Cycle.values;

                final porcentajes = Map.fromEntries(
                  ciclos.map(
                    (ciclo) => MapEntry(
                      ciclo,
                      (task.cyclesData[ciclo]! / 1500).clamp(0.0, 1.0),
                    ),
                  ),
                );

                return Container(
                  height: 200,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 2),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            task.completed
                                ? const Text(
                                  'Completed',
                                  style: TextStyle(
                                    color: Colors.green,
                                    fontWeight: FontWeight.bold,
                                  ),
                                )
                                : const Text(
                                  'Incomplete',
                                  style: TextStyle(
                                    color: Colors.red,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                            IconButton(
                              onPressed: () {
                                context.read<TaskHistoryCubit>().deleteTask(
                                  task.id!,
                                );
                              },
                              icon: const Icon(Icons.delete, color: Colors.red),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(
                                task.title,
                                overflow: TextOverflow.ellipsis,
                                softWrap: true,
                                maxLines: 2,
                                style: const TextStyle(
                                  fontSize: 23,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Text(
                              DateFormat('dd/MM/yyyy').format(task.date),
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          spacing: 4,
                          children: [
                            for (var ciclo in Cycle.values)
                              CycleProgressBar(percentage: porcentajes[ciclo]!),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
