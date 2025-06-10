part of 'information_page.dart';

final class _InformationView extends StatelessWidget {
  const _InformationView();

  @override
  Widget build(BuildContext context) {
    final intl = AppLocalizations.of(context)!;
    final textTheme = TextTheme.of(context);
    final textColor = Theme.of(context).colorScheme.primary;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(intl.pomodoro_description_appbar_title),
      ),
      body: SafeArea(
        child: ListView(
          key: const ValueKey('info_list_view'),
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
          children: [
            const SizedBox(height: 10),

            // App title and description
            Text(
              intl.app_name,
              style: textTheme.displaySmall!.copyWith(color: textColor),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            Text(
              intl.pomodoro_description_first_paragraph,
              style: textTheme.bodyLarge,
            ),
            const SizedBox(height: 20),

            // How it works
            Text(
              intl.pomodoro_how_works,
              style: textTheme.titleMedium!.copyWith(color: textColor),
            ),
            const SizedBox(height: 10),
            Text(intl.pomodoro_1_step_description, style: textTheme.bodyMedium),
            Text(intl.pomodoro_2_step_description, style: textTheme.bodyMedium),
            Text(intl.pomodoro_3_step_description, style: textTheme.bodyMedium),
            Text(intl.pomodoro_4_step_description, style: textTheme.bodyMedium),
            Text(intl.pomodoro_5_step_description, style: textTheme.bodyMedium),
            Text(intl.pomodoro_6_step_description, style: textTheme.bodyMedium),
            Text(intl.pomodoro_7_step_description, style: textTheme.bodyMedium),
            const SizedBox(height: 20),

            // Bennefits
            Text(
              intl.benefits,
              style: textTheme.titleMedium!.copyWith(color: textColor),
            ),
            const SizedBox(height: 10),
            Text(intl.pomodoro_1_benefit, style: textTheme.bodyMedium),
            Text(intl.pomodoro_2_benefit, style: textTheme.bodyMedium),
            Text(intl.pomodoro_3_benefit, style: textTheme.bodyMedium),
            Text(intl.pomodoro_4_benefit, style: textTheme.bodyMedium),
            Text(intl.pomodoro_5_benefit, style: textTheme.bodyMedium),
            const SizedBox(height: 10),
            const Divider(),
            const SizedBox(height: 5),
            // Developers
            Text(
              intl.pomodoro_description_app_developers_presentation,
              style: textTheme.labelLarge!.copyWith(
                fontWeight: FontWeight.bold,
                color: textColor,
              ),
            ),
            const SizedBox(height: 5),
            Text('Alan Nicolás Rosales', style: textTheme.titleSmall),
            Text('Anthony Hernandez Flores', style: textTheme.titleSmall),
            Text('Junior', style: textTheme.titleSmall),
          ],
        ),
      ),
    );
  }
}
