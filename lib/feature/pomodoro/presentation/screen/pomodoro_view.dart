part of './pomodoro_page.dart';

class _PomodoroView extends StatefulWidget {
  const _PomodoroView();

  @override
  State<_PomodoroView> createState() => _PomodoroViewState();
}

class _PomodoroViewState extends State<_PomodoroView> {
  final player = AudioPlayer();
  final String _defaultAudioAsset = 'assets/audio/rain.m4a';

  @override
  void initState() {
    super.initState();
    startPomodoro();
  }

  Future<void> startPomodoro() async {
    await player.setLoopMode(LoopMode.one);
    await player.setAsset(_defaultAudioAsset);
    await player.setVolume(0.5);
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
                  player.setLoopMode(LoopMode.one);
                case PomodoroStatus.running:
                  player.play();
                case PomodoroStatus.pause:
                  player.pause();
                case PomodoroStatus.done:
                  player.stop();
              }
            } else {
              player.pause();
            }
          },
          child: const Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(flex: 1, child: _UpperButtons()),
              Expanded(flex: 2, child: Center(child: _TitleWidget())),
              Expanded(flex: 4, child: _FillingBoxAnimation()),
              Expanded(flex: 3, child: _ActionButtons()),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.small(
        onPressed: () => _dialogBuilder(context),
        child: const Icon(Icons.settings_voice_rounded),
      ),
    );
  }

  Future<void> _dialogBuilder(BuildContext context) {
    final pomodoroBloc = context.read<PomodoroBloc>();

    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return BlocProvider.value(
          value: pomodoroBloc,
          child: AudioConfig(
            updatePlayerAsset: () {
              final assetSource = pomodoroBloc.state.audioAsset;

              if (assetSource != null) {
                final name = assetSource.split('/').last;

                showSnackBar(context, 'Actualizado a $name');
                player.setAsset(assetSource);
              }

              Navigator.pop(context);
            },
            turnOffPlayer: () => player.stop(),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }
}

class _TitleWidget extends StatelessWidget {
  const _TitleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PomodoroBloc, PomodoroState>(
      builder: (context, state) {
        final colorScheme = Theme.of(context).colorScheme;

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
                  border: const OutlineInputBorder(),
                  counterText: '',
                  hintText: 'Nueva Tarea',
                  hintStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: colorScheme.onSurfaceVariant.withValues(alpha: 0.6),
                  ),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 24),
                  constraints: BoxConstraints.loose(const Size(300, 60)),
                ),
                style: Theme.of(
                  context,
                ).textTheme.bodyMedium?.copyWith(color: colorScheme.onPrimary),
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
            ).textTheme.titleLarge?.copyWith(color: colorScheme.onPrimary),
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
