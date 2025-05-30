part of './pomodoro_page.dart';

class _PomodoroView extends StatefulWidget {
  const _PomodoroView();

  @override
  State<_PomodoroView> createState() => _PomodoroViewState();
}

class _PomodoroViewState extends State<_PomodoroView> {
  final _player = AudioPlayer();
  final String _audioPath = 'assets/audio/rain.m4a';

  Future<void> _startPomodoro() async {
    await _player.setLoopMode(LoopMode.one);
    await _player.setAsset(_audioPath);
    await _player.setVolume(0.5);
  }

  @override
  void initState() {
    super.initState();
    _startPomodoro();
  }

  @override
  void dispose() {
    _player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocListener<PomodoroBloc, PomodoroState>(
          listener: (context, state) {
            if (!state.isResting) {
              switch (state.status) {
                case PomodoroStatus.initial:
                  _player.setLoopMode(LoopMode.one);
                case PomodoroStatus.running:
                  _player.play();
                case PomodoroStatus.pause:
                  _player.pause();
                case PomodoroStatus.done:
                  _player.pause();
              }
            } else {
              _player.pause();
            }
          },
          child: const Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(flex: 0, child: _UpperButtons()),
              Expanded(flex: 2, child: Center(child: _TitleWidget())),
              Expanded(flex: 4, child: _FillingBoxAnimation()),
              Expanded(flex: 3, child: _ActionButtons()),
            ],
          ),
        ),
      ),
    );
  }
}

class _TitleWidget extends StatelessWidget {
  const _TitleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PomodoroBloc, PomodoroState>(
      builder: (context, state) {
        final colorScheme = Theme.of(context).colorScheme;
        final backgroundColor =
            !state.isResting ? colorScheme.primary : colorScheme.tertiary;
        if (state.status == PomodoroStatus.initial) {
          return Padding(
            padding: const EdgeInsets.all(16),
            child: SizedBox(
              width: 200,
              child: TextField(
                maxLines: 1,
                maxLength: 60,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  hintText: 'tarea',
                  hintStyle: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: colorScheme.onPrimary,
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 20,
                    horizontal: 12,
                  ),
                ),
                style: Theme.of(
                  context,
                ).textTheme.titleLarge!.copyWith(color: colorScheme.primary),
                onChanged:
                    (value) => context.read<PomodoroBloc>().add(
                      UpdateTitlePomodoro(value),
                    ),
              ),
            ),
          );
        } else {
          return Text(
            state.title ?? 'N/A',
            style: Theme.of(
              context,
            ).textTheme.titleLarge!.copyWith(color: backgroundColor),
          );
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
        final backgroundColor =
            !state.isResting
                ? Theme.of(context).colorScheme.primary
                : Theme.of(context).colorScheme.tertiary;
        return Row(
          children: [
            IconButton(
              onPressed: () {},
              iconSize: 25,
              color: backgroundColor,
              icon: const Icon(Icons.info),
            ),
            const Spacer(),
            IconButton(
              onPressed:
                  () => Navigator.of(context).push(TaskHistoryPage.route()),
              iconSize: 25,
              color: backgroundColor,
              icon: const Icon(Icons.article),
            ),
          ],
        );
      },
    );
  }
}
