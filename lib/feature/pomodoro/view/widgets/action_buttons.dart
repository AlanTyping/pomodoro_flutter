part of '../screen/pomodoro_page.dart';

class _ActionButtons extends StatelessWidget {
  const _ActionButtons();

  @override
  Widget build(BuildContext context) {
    const upperOffset = Offset(0, -15);
    const lowerOffset = Offset(0, 15);
    const iconSize = 40.0;

    return BlocBuilder<PomodoroBloc, PomodoroState>(
      builder: (context, state) {
        final bloc = context.read<PomodoroBloc>();
        final status = state.status;
        final backgroundColor =
            !state.isResting
                ? Theme.of(context).colorScheme.primary
                : Theme.of(context).colorScheme.tertiary;
        final intl = AppLocalizations.of(context)!;

        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: switch (status) {
            PomodoroStatus.initial => [
              TextButton.icon(
                style: textButtonStyle(context),
                onPressed:
                    () =>
                        state.title == null
                            ? showSnackBar(context, intl.add_new_task_snackbar)
                            : bloc.add(StartPomodoro()),
                label: Text(
                  'Iniciar',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                icon: const Icon(Icons.play_arrow_outlined, size: 25),
              ),
            ],
            PomodoroStatus.running => [
              Transform.translate(
                offset: upperOffset,
                child: IconButton.outlined(
                  onPressed: () => bloc.add(PausePomodoro()),
                  iconSize: iconSize,
                  color: backgroundColor,
                  icon: const Icon(Icons.pause),
                ),
              ),
              Transform.translate(
                offset: lowerOffset,
                child: IconButton.outlined(
                  onPressed: () => bloc.add(StopPomodoro()),
                  iconSize: iconSize,
                  color: backgroundColor,
                  icon: const Icon(Icons.stop),
                ),
              ),
              Transform.translate(
                offset: upperOffset,
                child: IconButton.outlined(
                  onPressed: () => bloc.add(SkipCyclePomodoro()),
                  iconSize: iconSize,
                  color: backgroundColor,
                  icon: const Icon(Icons.skip_next),
                ),
              ),
            ],
            PomodoroStatus.pause => [
              Transform.translate(
                offset: upperOffset,
                child: IconButton.outlined(
                  onPressed: () => bloc.add(ResumePomodoro()),
                  iconSize: iconSize,
                  color: backgroundColor,
                  icon: const Icon(Icons.play_arrow),
                ),
              ),
              Transform.translate(
                offset: lowerOffset,
                child: IconButton.outlined(
                  onPressed: () => bloc.add(StopPomodoro()),
                  iconSize: iconSize,
                  color: backgroundColor,
                  icon: const Icon(Icons.stop),
                ),
              ),
              Transform.translate(
                offset: upperOffset,
                child: IconButton.outlined(
                  onPressed: () => bloc.add(SkipCyclePomodoro()),
                  iconSize: iconSize,
                  color: backgroundColor,
                  icon: const Icon(Icons.skip_next),
                ),
              ),
            ],
            PomodoroStatus.done => [
              TextButton.icon(
                style: textButtonStyle(context),
                onPressed: () => bloc.add(FinishPomodoro()),
                label: Text(AppLocalizations.of(context)!.btn_save_and_restart),
                icon: const Icon(Icons.restore),
              ),
            ],
          },
        );
      },
    );
  }

  ButtonStyle textButtonStyle(BuildContext context) => TextButton.styleFrom(
    textStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
      color: Theme.of(context).colorScheme.onSurface,
    ),
  );
}
