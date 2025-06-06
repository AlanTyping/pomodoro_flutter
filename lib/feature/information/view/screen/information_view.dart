part of 'information_page.dart';

final class _InformationView extends StatelessWidget {
  const _InformationView();

  @override
  Widget build(BuildContext context) {
    final intl = AppLocalizations.of(context)!;
    final textTheme = TextTheme.of(context);

    return Scaffold(
      appBar: AppBar(centerTitle: true, title: const Text('Informacion')),
      body: SafeArea(
        child: ListView(
          key: const ValueKey('info_list_view'),
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
          children: [
            Text(intl.app_name, style: textTheme.displaySmall),
            Text(
              intl.pomodoro_description_first_paragraph,
              style: textTheme.bodyLarge,
            ),
            const SizedBox(height: 20),
            Text(intl.pomodoro_how_works, style: textTheme.titleMedium),
            Text(intl.pomodoro_1_step_description, style: textTheme.bodyMedium),
            Text(intl.pomodoro_2_step_description, style: textTheme.bodyMedium),
            Text(intl.pomodoro_3_step_description, style: textTheme.bodyMedium),
            Text(intl.pomodoro_4_step_description, style: textTheme.bodyMedium),
            Text(intl.pomodoro_5_step_description, style: textTheme.bodyMedium),
            Text(intl.pomodoro_6_step_description, style: textTheme.bodyMedium),
            Text(intl.pomodoro_7_step_description, style: textTheme.bodyMedium),
            const SizedBox(height: 20),
            Text(intl.benefits, style: textTheme.titleMedium),
            Text(intl.pomodoro_1_benefit, style: textTheme.bodyMedium),
            Text(intl.pomodoro_2_benefit, style: textTheme.bodyMedium),
            Text(intl.pomodoro_3_benefit, style: textTheme.bodyMedium),
            Text(intl.pomodoro_4_benefit, style: textTheme.bodyMedium),
            Text(intl.pomodoro_5_benefit, style: textTheme.bodyMedium),
            const Divider(),
            Text('Creadores de la app:', style: textTheme.labelLarge),
            Text('Alan', style: textTheme.titleSmall),
            Text('Anthony Hernandez Flores', style: textTheme.titleSmall),
            Text('Junior', style: textTheme.titleSmall),
          ],
        ),
      ),
    );
  }
}
