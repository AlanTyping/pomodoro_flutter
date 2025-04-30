part of '../screen/pomodoro_page.dart';

class _FillingBoxAnimation extends StatelessWidget {
  const _FillingBoxAnimation();

  @override
  Widget build(BuildContext context) {
    return BlocSelector<PomodoroBloc, PomodoroState, Duration>(
      selector: (state) => state.timer,
      builder: (context, timer) {
        return Text(
          timer.toString(),
          style: Theme.of(context).textTheme.displayMedium,
        );
      },
    );
  }
}
