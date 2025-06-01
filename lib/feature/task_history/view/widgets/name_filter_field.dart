part of '../screen/task_history_page.dart';

class _NameFilterField extends StatelessWidget {
  const _NameFilterField();

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return TextField(
      onChanged: context.read<TaskHistoryCubit>().changeNameFilter,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: colorScheme.outline),
        ),
        labelText: 'Filtro por Nombre',
        hintText: 'Nombre de la tarea',
        hintStyle: textTheme.bodyMedium?.copyWith(
          color: colorScheme.outline.withValues(alpha: 0.5),
        ),
      ),
    );
  }
}
