part of './pomodoro_page.dart';

class _PomodoroView extends StatefulWidget {
  const _PomodoroView();

  @override
  State<_PomodoroView> createState() => _PomodoroViewState();
}

class _PomodoroViewState extends State<_PomodoroView> {
  final audioPlayer = AudioPlayer();

  @override
  void initState() {
    super.initState();
    audioPlayer.setAsset('assets/audio/water.m4a');
    audioPlayer.setVolume(0.5);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocListener<PomodoroBloc, PomodoroState>(
          listener: (context, state) {
            switch (state.status) {
              case PomodoroStatus.initial:
                audioPlayer.setLoopMode(LoopMode.one);
              case PomodoroStatus.running:
                audioPlayer.play();
              case PomodoroStatus.pause:
                audioPlayer.pause();
              case PomodoroStatus.done:
                audioPlayer.pause();
            }
          },
          child: const Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Flexible(flex: 1, child: _UpperButtons()),
              Flexible(flex: 2, child: _TitleWidget()),
              Expanded(flex: 11, child: _FillingBoxAnimation()),
              Flexible(flex: 2, child: _ActionButtons()),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    audioPlayer.dispose();
    super.dispose();
  }
}

class _TitleWidget extends StatelessWidget {
  const _TitleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme.titleMedium;
    return BlocBuilder<PomodoroBloc, PomodoroState>(
      builder: (context, state) {
        if (state.status == PomodoroStatus.initial) {
          return const TextField(
            maxLines: 1,
            maxLength: 60,
            decoration: InputDecoration(
              labelText: 'Tituto de la tarea',
              hintText: 'Titulo',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(10),
                borderSide: BorderSide(color: colorScheme.outline),
              ),
            ),
            style: textStyle,
            onChanged:
                (value) => context.read<PomodoroBloc>().add(
                  UpdateTitlePomodoro(value),
                ),
          );
        } else {
          return Text(state.title ?? 'N/A', style: textStyle);
        }
      },
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
