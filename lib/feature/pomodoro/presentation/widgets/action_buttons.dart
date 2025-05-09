part of '../screen/pomodoro_page.dart';

class _ActionButtons extends StatelessWidget {
  const _ActionButtons();

  @override
  Widget build(BuildContext context) {
    const upperOffset = Offset(0, -15);
    const lowerOffset = Offset(0, 15);
    const iconSize = 40.0;

    return BlocSelector<PomodoroBloc, PomodoroState, PomodoroStatus>(
      selector: (state) => state.status,
      builder: (context, status) {
        final bloc = context.read<PomodoroBloc>();

        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: switch (status) {
            PomodoroStatus.initial => [
              TextButton.icon(
                style: textButtonStyle(context),
                onPressed: () => bloc.add(StartPomodoro()),
                label: const Text('Iniciar'),
                icon: const Icon(Icons.play_arrow_outlined),
              ),
            ],
            PomodoroStatus.running => [
              Transform.translate(
                offset: upperOffset,
                child: IconButton.outlined(
                  onPressed: () => bloc.add(PausePomodoro()),
                  iconSize: iconSize,
                  icon: const Icon(Icons.pause),
                ),
              ),
              Transform.translate(
                offset: lowerOffset,
                child: IconButton.outlined(
                  onPressed: () => bloc.add(StopPomodoro()),
                  iconSize: iconSize,
                  icon: const Icon(Icons.stop),
                ),
              ),
              Transform.translate(
                offset: upperOffset,
                child: IconButton.outlined(
                  onPressed: () => bloc.add(SkipCyclePomodoro()),
                  iconSize: iconSize,
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
                  icon: const Icon(Icons.play_arrow),
                ),
              ),
              Transform.translate(
                offset: lowerOffset,
                child: IconButton.outlined(
                  onPressed: () => bloc.add(StopPomodoro()),
                  iconSize: iconSize,
                  icon: const Icon(Icons.stop),
                ),
              ),
              Transform.translate(
                offset: upperOffset,
                child: IconButton.outlined(
                  onPressed: () => bloc.add(SkipCyclePomodoro()),
                  iconSize: iconSize,
                  icon: const Icon(Icons.skip_next),
                ),
              ),
            ],
            PomodoroStatus.done => [
              TextButton.icon(
                style: textButtonStyle(context),
                onPressed: () => bloc.add(FinishPomodoro()),
                label: const Text('Guardar y Reiniciar'),
                icon: const Icon(Icons.restore),
              ),
            ],
          },
        );
      },
    );
  }

  ButtonStyle textButtonStyle(BuildContext context) =>
      TextButton.styleFrom(textStyle: Theme.of(context).textTheme.titleMedium);
}
