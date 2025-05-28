part of './pomodoro_page.dart';

class _PomodoroView extends StatelessWidget {
  const _PomodoroView();

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Flexible(flex: 1, child: _UpperButtons()),
            Expanded(flex: 11, child: _FillingBoxAnimation()),
            Flexible(flex: 2, child: _ActionButtons()),
          ],
        ),
      ),
    );
  }
}

class _UpperButtons extends StatelessWidget {
  const _UpperButtons();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PomodoroBloc, PomodoroState>(
      builder: (context, state) {
        final _backgroundColor =
            !state.isResting
                ? Theme.of(context).colorScheme.primary
                : Theme.of(context).colorScheme.tertiary;
        return Row(
          children: [
            IconButton(
              onPressed: () {},
              iconSize: 25,
              color: _backgroundColor,
              icon: const Icon(Icons.info),
            ),
            const Spacer(),
            IconButton(
              onPressed:
                  () => Navigator.of(context).push(TaskHistoryPage.route()),
              iconSize: 25,
              color: _backgroundColor,
              icon: const Icon(Icons.article),
            ),
          ],
        );
      },
    );
  }
}
