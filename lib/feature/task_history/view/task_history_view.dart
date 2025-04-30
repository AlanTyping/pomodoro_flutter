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
            child: ListView.builder(
              itemCount: state.tasks.length,
              itemBuilder: (context, index) {
                final task = state.tasks.elementAt(
                  // mostrar el último elemento primero, y así sucesivamente.
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

                return Column(
                  children: [
                    if (index != 0)
                      const SizedBox(
                        height: 10,
                        child: ColoredBox(color: Colors.green),
                      ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [Text(task.title), Text(task.date.toString())],
                    ),

                    Row(
                      children: [
                        for (var ciclo in Cycle.values)
                          CycleProgressBar(percentage: porcentajes[ciclo]!),
                      ],
                    ),
                  ],
                );
              },
            ),
          );
        },
      ),
    );
  }
}
