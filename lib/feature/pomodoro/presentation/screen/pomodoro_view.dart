part of 'pomodoro_page.dart';

class _PomodoroView extends StatelessWidget {
  const _PomodoroView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BlocBuilder<PomodoroCubit, PomodoroState>(
          builder: (context, PomodoroState state) {
            final cubit = context.read<PomodoroCubit>();
            final buttons = Row(
              children: [
                IconButton(
                  onPressed: cubit.onStart,
                  icon: Icon(Icons.play_arrow),
                ),
                IconButton(onPressed: cubit.onPaused, icon: Icon(Icons.pause)),
                IconButton(onPressed: cubit.onCancel, icon: Icon(Icons.stop)),
                IconButton(
                  onPressed: cubit.onSkipCycle,
                  icon: Icon(Icons.skip_next),
                ),
              ],
            );

            switch (state) {
              case PomodoroInitialState():
                return Column(
                  children: [
                    Expanded(
                      child: Text(
                        "Nueva tarea",
                        style: Theme.of(context).textTheme.displayLarge,
                      ),
                    ),
                    ElevatedButton(
                      onPressed: cubit.onStart,
                      child: Text("Comenzar"),
                    ),
                  ],
                );
              case PomodoroStartState():
                return ColoredBox(
                  color: Colors.amber,
                  child: Column(children: [Text(state.task.title), buttons]),
                );
              case PomodoroRunningState():
                return Column(children: [Text(state.task.title), buttons]);
              case PomodoroPausedState():
                return Column(children: [Text(state.task.title), buttons]);
            }
          },
        ),
      ),
    );
  }
}
