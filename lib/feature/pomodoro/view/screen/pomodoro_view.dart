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
    startPomodoroAudio();
  }

  Future<void> startPomodoroAudio() async {
    await player.setAsset(_defaultAudioAsset);
    await player.setLoopMode(LoopMode.one);
    await player.setVolume(0.5);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocListener<PomodoroBloc, PomodoroState>(
          listener: (context, state) async {
            if (!state.isResting && state.audioAsset != null) {
              switch (state.status) {
                case PomodoroStatus.initial:
                  break;
                case PomodoroStatus.running:
                  await player.play();
                  break;
                case PomodoroStatus.pause:
                  await player.pause();
                  break;
                case PomodoroStatus.done:
                  await player.stop();
                  break;
              }
            } else {
              await player.pause();
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
        onPressed: () => _audioDialogBuilder(context),
        elevation: 0,
        backgroundColor: Theme.of(context).colorScheme.onSecondary,
        child: BlocBuilder<PomodoroBloc, PomodoroState>(
          builder: (context, state) {
            if (state.audioAsset != null) {
              return const Icon(Icons.volume_up_outlined);
            }
            return const Icon(Icons.volume_off);
          },
        ),
      ),
    );
  }

  Future<void> _audioDialogBuilder(BuildContext context) {
    final pomodoroBloc = context.read<PomodoroBloc>();

    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return BlocProvider.value(
          value: pomodoroBloc,
          child: AudioConfig(
            updatePlayerAsset: (String? asset) async {
              Navigator.pop(context);
              if (asset != null) {
                if (asset != 'mute') {
                  final name = asset.split('/').last;
                  pomodoroBloc.add(UpdatePomodoroSound(asset: name));

                  showSnackBar(
                    context,
                    AppLocalizations.of(context)!.change_to_label(name),
                  );

                  await AudioConfigSharedPreferences.setAudioConfig(asset);
                  await player.setAsset(asset);
                } else {
                  await AudioConfigSharedPreferences.setAudioConfig('');
                  pomodoroBloc.add(MutePomodoroSound());
                  await player.stop();
                }
              }
            },
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
                  hintText:
                      AppLocalizations.of(context)!.task_input_placeholder,
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
        final colorScheme = Theme.of(context).colorScheme;
        final backgroundColor =
            !state.isResting ? colorScheme.primary : colorScheme.tertiary;

        return Row(
          children: [
            IconButton(
              onPressed:
                  () => Navigator.of(context).push(InformationPage.route()),
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
