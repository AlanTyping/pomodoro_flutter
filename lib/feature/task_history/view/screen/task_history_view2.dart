part of 'task_history_page.dart';

class _TaskHistoryViewTest extends StatefulWidget {
  @override
  State<_TaskHistoryViewTest> createState() => _TaskHistoryViewState();
}

class _TaskHistoryViewState extends State<_TaskHistoryViewTest> {
  final TextEditingController _titleController = TextEditingController();
  DateTime? _selectedDate;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Historial de Tareas")),
      body: BlocBuilder<TaskHistoryCubit, TaskHistoryState>(
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          return Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              children: [
                _buildFilterSection(context),
                const SizedBox(height: 10),
                Expanded(
                  child: ListView.builder(
                    itemCount: state.filteredTasks.length,
                    itemBuilder: (context, index) {
                      final task = state.filteredTasks.elementAt(
                        state.filteredTasks.length - index - 1,
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
                            children: [
                              Text(task.title),
                              Text(task.date.toString().split(" ").first),
                            ],
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
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildFilterSection(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: _titleController,
          decoration: const InputDecoration(
            labelText: 'Buscar por nombre',
            border: OutlineInputBorder(),
            prefixIcon: Icon(Icons.search),
          ),
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            Expanded(
              child: ElevatedButton.icon(
                onPressed: () async {
                  final selected = await showDatePicker(
                    context: context,
                    initialDate: _selectedDate ?? DateTime.now(),
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2100),
                  );

                  if (selected != null) {
                    setState(() => _selectedDate = selected);
                  }
                },
                icon: const Icon(Icons.calendar_today),
                label: Text(_selectedDate == null
                    ? "Filtrar por fecha"
                    : "Fecha: ${_selectedDate!.toLocal()}".split(' ')[0]),
              ),
            ),
            const SizedBox(width: 8),
            ElevatedButton(
              onPressed: () {
                context.read<TaskHistoryCubit>().filterTasks(
                      titleQuery: _titleController.text,
                      date: _selectedDate,
                    );
              },
              child: const Text("Aplicar Filtro"),
            ),
            const SizedBox(width: 8),
            IconButton(
              icon: const Icon(Icons.clear),
              tooltip: 'Limpiar filtros',
              onPressed: () {
                setState(() {
                  _titleController.clear();
                  _selectedDate = null;
                });
                context.read<TaskHistoryCubit>().filterTasks();
              },
            ),
          ],
        ),
      ],
    );
  }
}
