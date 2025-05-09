part of 'task_history_page.dart';

class _TaskHistoryView extends StatelessWidget {
  const _TaskHistoryView({super.key});

  @override
  Widget build(BuildContext context) {
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
                  const _FilterSection(),
                  const Divider(),
                  Expanded(
                    child: _TaskListView(
                      tasks: state.filteredTasks,
                      onDeleteTask: cubit.deleteTask,
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

class _FilterSection extends StatelessWidget {
  const _FilterSection();

  @override
  Widget build(BuildContext context) {
    final dateFormat = DateFormat('dd/MM/yyyy');

    return Column(
      spacing: 8,
      children: [
        const _NameFilterField(),
        _DateFilterButton(dateFormat: dateFormat),
        const _FilterActionButtons(),
      ],
    );
  }
}

class _DateFilterButton extends StatelessWidget {
  const _DateFilterButton({required this.dateFormat});

  final DateFormat dateFormat;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<TaskHistoryCubit>();

    return BlocSelector<TaskHistoryCubit, TaskHistoryState, DateTime?>(
      selector: (state) => state.dateFilter,
      builder:
          (context, dateFilter) => ElevatedButton.icon(
            onPressed: () async {
              final date = await showDatePicker(
                context: context,
                initialDate: dateFilter ?? DateTime.now(),
                firstDate: DateTime(2000),
                lastDate: DateTime(2100),
              );

              cubit.changeDateFilter(date);
            },
            icon: const Icon(Icons.calendar_today),
            label: Text(
              dateFilter != null
                  ? 'Fecha: ${dateFormat.format(dateFilter)}'
                  : 'Seleccionar Fecha',
            ),
          ),
    );
  }
}

class _FilterActionButtons extends StatelessWidget {
  const _FilterActionButtons();

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final cubit = context.read<TaskHistoryCubit>();

    return Row(
      spacing: 15,
      children: [
        Expanded(
          child: ElevatedButton(
            onPressed: cubit.applyFilters,
            child: const Text('Aplicar Filtros'),
          ),
        ),
        IconButton.filled(
          style: IconButton.styleFrom(
            backgroundColor: colorScheme.errorContainer,
            foregroundColor: colorScheme.onErrorContainer,
          ),
          onPressed: cubit.clearFilters,
          tooltip: 'Limpiar Filtros',
          icon: const Icon(Icons.clear),
        ),
      ],
    );
  }
}
