part of '../screen/task_history_page.dart';

class _NameFilterField extends StatelessWidget {
  const _NameFilterField();

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final intl = AppLocalizations.of(context)!;

    return TextField(
      onChanged: context.read<TaskHistoryCubit>().changeNameFilter,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: colorScheme.outline),
        ),
        labelText: intl.task_history_input_labelText,
        hintText: intl.task_history_input_hintText,
        hintStyle: textTheme.bodyMedium?.copyWith(
          color: colorScheme.outline.withValues(alpha: 0.5),
        ),
      ),
    );
  }
}
