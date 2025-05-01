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
                onPressed: () => bloc.add(const PomodoroEvent.start()),
                label: const Text('Iniciar'),
                icon: const Icon(Icons.play_arrow_outlined),
              ),
            ],
            PomodoroStatus.running => [
              Transform.translate(
                offset: upperOffset,
                child: IconButton.outlined(
                  onPressed: () => bloc.add(const PomodoroEvent.pause()),
                  iconSize: iconSize,
                  icon: const Icon(Icons.pause),
                ),
              ),
              Transform.translate(
                offset: lowerOffset,
                child: IconButton.outlined(
                  onPressed: () => bloc.add(const PomodoroEvent.stop()),
                  iconSize: iconSize,
                  icon: const Icon(Icons.stop),
                ),
              ),
              Transform.translate(
                offset: upperOffset,
                child: IconButton.outlined(
                  onPressed: () => bloc.add(const PomodoroEvent.skipCycle()),
                  iconSize: iconSize,
                  icon: const Icon(Icons.skip_next),
                ),
              ),
            ],
            PomodoroStatus.pause => [
              Transform.translate(
                offset: upperOffset,
                child: IconButton.outlined(
                  onPressed: () => bloc.add(const PomodoroEvent.resume()),
                  iconSize: iconSize * 1.2,
                  icon: const Icon(Icons.play_arrow),
                ),
              ),
              Transform.translate(
                offset: lowerOffset,
                child: IconButton.outlined(
                  onPressed: () => bloc.add(const PomodoroEvent.stop()),
                  iconSize: iconSize,
                  icon: const Icon(Icons.stop),
                ),
              ),
              Transform.translate(
                offset: upperOffset,
                child: IconButton.outlined(
                  onPressed: () => bloc.add(const PomodoroEvent.skipCycle()),
                  iconSize: iconSize,
                  icon: const Icon(Icons.skip_next),
                ),
              ),
            ],
            PomodoroStatus.done => [
              TextButton.icon(
                style: textButtonStyle(context),
                onPressed: () => bloc.add(const PomodoroEvent.finish()),
                label: const Text('Reiniciar'),
                icon: const Icon(Icons.restore),
              ),
            ],
          },
        );
      },
    );
  }

  ButtonStyle textButtonStyle(BuildContext context) =>
      TextButton.styleFrom(textStyle: Theme.of(context).textTheme.labelLarge);
}
