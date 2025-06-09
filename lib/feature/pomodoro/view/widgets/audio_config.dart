import 'package:flutter/material.dart';
import 'package:pomodoro_flutter/l10n/l10n.dart';

import 'audio_config_button.dart';

class AudioConfig extends StatefulWidget {
  final Future<void> Function(String? asset) updatePlayerAsset;

  const AudioConfig({super.key, required this.updatePlayerAsset});

  @override
  State<AudioConfig> createState() => _AudioConfigState();
}

class _AudioConfigState extends State<AudioConfig> {
  String? selectedAudio;

  @override
  void initState() {
    super.initState();
    selectedAudio = null;
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final intl = AppLocalizations.of(context)!;
    final brightnessDark =
        View.of(context).platformDispatcher.platformBrightness ==
                Brightness.dark
            ? true
            : false;

    return Dialog(
      child: Container(
        constraints: const BoxConstraints(maxWidth: 320, maxHeight: 600),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: brightnessDark ? colorScheme.surface : colorScheme.primary,
        ),
        child: Column(
          spacing: 8,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            AudioConfigButton(
              onPressed: () => {selectedAudio = 'mute'},
              icon: Icons.music_off_rounded,
              title: intl.audio_config_btn_without_audio,
            ),
            Divider(
              height: 2,
              color:
                  brightnessDark ? colorScheme.primary : colorScheme.onPrimary,
            ),
            AudioConfigButton(
              onPressed:
              // () => context.read<PomodoroBloc>().add(
              //   UpdatePomodoroSound(asset: 'assets/audio/fire.m4a'),
              // ),
              () {
                selectedAudio = 'assets/audio/fire.m4a';
              },
              icon: Icons.fireplace,
              title: intl.audio_config_btn_fire,
            ),
            AudioConfigButton(
              onPressed:
              // () => context.read<PomodoroBloc>().add(
              //   UpdatePomodoroSound(asset: 'assets/audio/water.m4a'),
              // ),
              () {
                selectedAudio = 'assets/audio/water.m4a';
              },
              icon: Icons.water_drop_rounded,
              title: intl.audio_config_btn_drip,
            ),
            AudioConfigButton(
              onPressed:
              // () => context.read<PomodoroBloc>().add(
              //   UpdatePomodoroSound(asset: 'assets/audio/rain.m4a'),
              // ),
              () {
                selectedAudio = 'assets/audio/rain.m4a';
              },
              icon: Icons.waterfall_chart_rounded,
              title: intl.audio_config_btn_rain,
            ),
            ElevatedButton(
              onPressed: () {
                widget.updatePlayerAsset(selectedAudio);
              },
              style: ElevatedButton.styleFrom(
                minimumSize: const Size.fromHeight(70),
                padding: const EdgeInsets.symmetric(
                  vertical: 5,
                  horizontal: 50,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadiusGeometry.circular(10),
                ),
                backgroundColor:
                    brightnessDark
                        ? colorScheme.secondaryContainer
                        : colorScheme.onPrimary,
                foregroundColor: colorScheme.onPrimaryContainer,
              ),
              child: Text(
                intl.audio_config_btn_save,
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  fontWeight: FontWeight.bold,
                  color:
                      brightnessDark
                          ? colorScheme.inverseSurface
                          : colorScheme.surface,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
