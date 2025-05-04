part of '../screen/pomodoro_page.dart';

class _FillingBoxAnimation extends StatelessWidget {
  const _FillingBoxAnimation();

  @override
  Widget build(BuildContext context) {
    return BlocSelector<PomodoroBloc, PomodoroState, Duration>(
      selector: (state) => state.timer,
      builder: (context, timer) {
        final totalSeconds = const Duration(minutes: 25).inSeconds;
        final currentSeconds = totalSeconds - timer.inSeconds;

        return Column(
          spacing: 10,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox.square(
              dimension: 200,
              child: _SphereShaderWidget(
                total: totalSeconds,
                current: currentSeconds,
              ),
            ),

            Text(
              '${(timer.inSeconds ~/ 60).toString().padLeft(2, '0')}:${(timer.inSeconds.remainder(60).toString().padLeft(2, '0'))}',
              style: Theme.of(context).textTheme.displayMedium,
            ),
          ],
        );
      },
    );
  }
}
