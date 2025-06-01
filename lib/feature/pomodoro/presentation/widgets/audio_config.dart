import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pomodoro_flutter/feature/pomodoro/presentation/widgets/ui/audio_config_button.dart';

import '../bloc/pomodoro_bloc.dart';

class AudioConfig extends StatelessWidget {
  final VoidCallback updatePlayerAsset;
  final VoidCallback turnOffPlayer;

  const AudioConfig({
    super.key,
    required this.updatePlayerAsset,
    required this.turnOffPlayer,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Center(
      child: Container(
        constraints: const BoxConstraints(maxWidth: 320, maxHeight: 600),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: colorScheme.tertiaryContainer,
        ),
        child: Column(
          spacing: 8,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            AudioConfigButton(
              onPressed: turnOffPlayer,
              icon: Icons.music_off_rounded,
              title: "sin audio",
            ),
            Divider(height: 2, color: colorScheme.outline),
            AudioConfigButton(
              onPressed:
                  () => context.read<PomodoroBloc>().add(
                    UpdateSoundPomodoro(asset: 'assets/audio/fire.m4a'),
                  ),
              icon: Icons.fireplace,
              title: "fuego",
            ),
            AudioConfigButton(
              onPressed:
                  () => context.read<PomodoroBloc>().add(
                    UpdateSoundPomodoro(asset: 'assets/audio/water.m4a'),
                  ),
              icon: Icons.water_drop_rounded,
              title: "goteo",
            ),
            AudioConfigButton(
              onPressed:
                  () => context.read<PomodoroBloc>().add(
                    UpdateSoundPomodoro(asset: 'assets/audio/rain.m4a'),
                  ),
              icon: Icons.waterfall_chart_rounded,
              title: "lluvia",
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: updatePlayerAsset,
              style: ElevatedButton.styleFrom(
                minimumSize: const Size.fromHeight(60),
                padding: const EdgeInsets.symmetric(
                  vertical: 5,
                  horizontal: 50,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadiusGeometry.circular(10),
                ),
                backgroundColor: colorScheme.primaryContainer,
                foregroundColor: colorScheme.onPrimaryContainer,
              ),
              child: Text(
                "Guardar",
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
          ],
        ),
      ),
    ).animate().slide(
      begin: const Offset(0, 1),
      duration: const Duration(microseconds: 500),
    ); //
  }
}
