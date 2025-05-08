part of 'task_history_page.dart';

class _TaskHistoryView extends StatelessWidget {
  const _TaskHistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(title: const Text('Historial')),
      body: SafeArea(
        child: BlocBuilder<TaskHistoryCubit, TaskHistoryState>(
          builder: (context, state) {
            final cubit = context.read<TaskHistoryCubit>();

            return Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                spacing: 10,
                children: [
                  SizedBox(
                    child: Column(
                      spacing: 8,
                      children: [
                        TextField(
                          onChanged: cubit.changeNameFilter,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide(
                                color: colorScheme.secondary,
                              ),
                            ),
                            labelText: 'Filtro por Nombre',
                            hintText: 'Nombre de la tarea',
                          ),
                        ),
                        ElevatedButton.icon(
                          onPressed: () async {
                            final date = await showDatePicker(
                              context: context,
                              initialDate: state.dateFilter ?? DateTime.now(),
                              firstDate: DateTime(2000),
                              lastDate: DateTime(2100),
                            );

                            cubit.changeDateFilter(date);
                          },
                          icon: const Icon(Icons.calendar_today),
                          label: Text(
                            state.dateFilter != null
                                ? 'Fecha: ${state.dateFilter!.day}/${state.dateFilter!.month}/${state.dateFilter!.year}/'
                                : 'Seleccionar Fecha',
                          ),
                        ),
                        Row(
                          spacing: 15,
                          children: [
                            Expanded(
                              child: ElevatedButton(
                                onPressed: cubit.applyFilters,
                                child: const Text('Aplicar Filtros'),
                              ),
                            ),
                            IconButton.filled(
                              color: colorScheme.error,
                              onPressed: cubit.clearFilters,
                              tooltip: 'Limpiar Filtros',
                              icon: const Icon(Icons.clear),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  Expanded(
                    child: ListView.separated(
                      padding: const EdgeInsets.all(8),
                      separatorBuilder:
                          (context, index) => const SizedBox(height: 16),
                      itemCount: state.filteredTasks.length,
                      itemBuilder: (context, index) {
                        final task = state.filteredTasks.elementAt(index);

                        final cycles = Cycle.values;

                        final percentages = Map.fromEntries(
                          cycles.map(
                            (ciclo) => MapEntry(
                              ciclo,
                              (task.cyclesData[ciclo]! / 1500).clamp(0.0, 1.0),
                            ),
                          ),
                        );

                        return Card(
                          child: Padding(
                            padding: const EdgeInsets.all(12),
                            child: Column(
                              spacing: 8,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Expanded(
                                      child:
                                          task.completed
                                              ? Text(
                                                'Completado',
                                                style: textTheme.titleMedium
                                                    ?.copyWith(
                                                      color: Colors.greenAccent,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                              )
                                              : Text(
                                                'Incompleto',
                                                style: textTheme.titleSmall
                                                    ?.copyWith(
                                                      color: colorScheme.error,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                              ),
                                    ),

                                    IconButton(
                                      onPressed: () => cubit.deleteTask(task),
                                      icon: Icon(
                                        Icons.delete,
                                        color: colorScheme.error,
                                      ),
                                    ),
                                  ],
                                ),

                                Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        task.title,
                                        overflow: TextOverflow.ellipsis,
                                        softWrap: true,
                                        maxLines: 2,
                                        style: textTheme.bodyLarge,
                                      ),
                                    ),
                                    Text(
                                      DateFormat(
                                        'dd/MM/yyyy',
                                      ).format(task.date),
                                      style: textTheme.bodyLarge,
                                    ),
                                  ],
                                ),

                                ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: Row(
                                    spacing: 4,
                                    children:
                                        Cycle.values
                                            .map(
                                              (cycle) => Expanded(
                                                child: CycleProgressBar(
                                                  percentage:
                                                      percentages[cycle],
                                                ),
                                              ),
                                            )
                                            .toList(),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
