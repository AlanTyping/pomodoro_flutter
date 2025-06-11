part of 'task_history_page.dart';

class _TaskHistoryView extends StatelessWidget {
  const _TaskHistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    final intl = AppLocalizations.of(context)!;
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          intl.task_history_appbar_title,
          style: TextStyle(color: colorScheme.primary),
        ),
      ),
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
        Row(
          spacing: 8,
          children: [
            const Expanded(child: _NameFilterField()),
            _DateFilterButton(dateFormat: dateFormat),
          ],
        ),
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
      builder: (context, dateFilter) {
        final colorScheme = Theme.of(context).colorScheme;

        return IconButton(
          onPressed: () async {
            final date = await showDatePicker(
              context: context,
              initialDate: dateFilter ?? DateTime.now(),
              firstDate: DateTime(2000),
              lastDate: DateTime(2100),
            );

            cubit.changeDateFilter(date);
          },
          icon: Icon(Icons.calendar_today, color: colorScheme.primary),
        );
      },
    );
  }
}

class _FilterActionButtons extends StatelessWidget {
  const _FilterActionButtons();

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final cubit = context.read<TaskHistoryCubit>();
    final intl = AppLocalizations.of(context)!;

    return Row(
      spacing: 15,
      children: [
        Expanded(
          child: ElevatedButton(
            onPressed: cubit.applyFilters,
            child: Text(intl.task_history_apply_filters_button),
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
