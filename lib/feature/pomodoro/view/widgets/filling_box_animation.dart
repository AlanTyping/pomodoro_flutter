part of '../screen/pomodoro_page.dart';

class _FillingBoxAnimation extends StatelessWidget {
  const _FillingBoxAnimation();

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final isResting = context.select(
      (PomodoroBloc bloc) => bloc.state.isResting,
    );

    return BlocSelector<PomodoroBloc, PomodoroState, Duration>(
      selector: (state) => state.timer,
      builder: (context, timer) {
        final totalSeconds =
            isResting ? PomodoroBloc.restDuration : PomodoroBloc.workDuration;

        final currentSeconds = totalSeconds.inSeconds - timer.inSeconds;

        return Stack(
          alignment: Alignment.center,
          children: [
            LayoutBuilder(
              builder:
                  (context, constraints) => SizedBox.square(
                    dimension: constraints.maxWidth,
                    child: _SphereShaderWidget(
                      total: totalSeconds.inSeconds,
                      fillColor:
                          isResting
                              ? colorScheme.tertiaryContainer
                              : colorScheme.primaryContainer,
                      current: currentSeconds,
                      unFillColor: colorScheme.surface,
                    ),
                  ),
            ),

            Center(
              child: Container(
                decoration: BoxDecoration(
                  color: colorScheme.surface,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Text(
                    '${(timer.inSeconds ~/ 60).toString().padLeft(2, '0')}:${(timer.inSeconds.remainder(60).toString().padLeft(2, '0'))}',
                    style: Theme.of(context).textTheme.displayMedium?.copyWith(
                      color:
                          isResting
                              ? colorScheme.tertiary
                              : colorScheme.primary,
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
