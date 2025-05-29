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
            if (!state.isResting) {
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
            } else {
              audioPlayer.pause();
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
    return BlocBuilder<PomodoroBloc, PomodoroState>(
      builder: (context, state) {
        final colorScheme = Theme.of(context).colorScheme;
        final backgroundColor =
            !state.isResting ? colorScheme.primary : colorScheme.tertiary;
        if (state.status == PomodoroStatus.initial) {
          return Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              maxLines: 1,
              maxLength: 60,
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                hintText: 'Añadir tarea',
                hintStyle: Theme.of(
                  context,
                ).textTheme.titleLarge!.copyWith(color: colorScheme.onPrimary),
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 20,
                  horizontal: 12,
                ),
                border: OutlineInputBorder(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  borderSide: BorderSide(color: colorScheme.outline),
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
