part of 'pomodoro_page.dart';

class _PomodoroView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Pomodoro Timer')),
      body: Column(
        spacing: 5,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: TextField(
              onChanged:
                  (value) => context.read<PomodoroBloc>().add(
                    PomodoroEvent.updateTitle(value),
                  ),
              enabled: context.select(
                (PomodoroBloc bloc) =>
                    !bloc.state.isRunning && bloc.state.cycle == Cycle.first,
              ),
            ),
          ),
          const Padding(padding: EdgeInsets.all(15.0), child: TimerText()),
          Center(
            child: Text(
              context.select((PomodoroBloc bloc) => bloc.state.cycle.name),
              style: Theme.of(context).textTheme.labelLarge,
            ),
          ),
          BlocBuilder<PomodoroBloc, PomodoroState>(
            builder: (context, state) {
              final bloc = context.read<PomodoroBloc>();

              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton.filled(
                    icon: const Icon(Icons.play_arrow_rounded),
                    onPressed: () => bloc.add(const PomodoroEvent.start()),
                  ),
                  IconButton.filled(
                    icon: const Icon(Icons.pause_rounded),
                    onPressed: () => bloc.add(const PomodoroEvent.pause()),
                  ),
                  IconButton.filled(
                    icon: const Icon(Icons.stop_rounded),
                    onPressed: () => bloc.add(const PomodoroEvent.stop()),
                  ),
                  IconButton.filled(
                    icon: const Icon(Icons.skip_next_rounded),
                    onPressed: () => bloc.add(const PomodoroEvent.skipCycle()),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
