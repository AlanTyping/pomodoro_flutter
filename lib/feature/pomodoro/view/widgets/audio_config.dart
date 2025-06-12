import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:pomodoro_flutter/core/constants.dart';
import 'package:pomodoro_flutter/l10n/l10n.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
    selectedAudio = GetIt.I.get<SharedPreferences>().getString(audioConfigKey);
  }

  void setAudio([String? audioPath]) =>
      setState(() => selectedAudio = audioPath);

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final intl = AppLocalizations.of(context)!;

    return Dialog(
      child: Container(
        constraints: const BoxConstraints(maxWidth: 320, maxHeight: 600),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: colorScheme.surface,
        ),
        child: Column(
          spacing: 8,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            AudioConfigButton(
              onPressed: () => setAudio(),
              icon: Icons.music_off_rounded,
              title: intl.audio_config_btn_without_audio,
              isSelected: selectedAudio == null,
            ),
            const Divider(height: 4),
            AudioConfigButton(
              onPressed: () => setAudio('assets/audio/fire.m4a'),
              icon: Icons.fireplace,
              title: intl.audio_config_btn_fire,
              isSelected: selectedAudio?.contains('fire') ?? false,
            ),
            AudioConfigButton(
              onPressed: () => setAudio('assets/audio/water.m4a'),
              icon: Icons.water_drop_rounded,
              title: intl.audio_config_btn_drip,
              isSelected: selectedAudio?.contains('water') ?? false,
            ),
            AudioConfigButton(
              onPressed: () => setAudio('assets/audio/rain.m4a'),
              icon: Icons.waterfall_chart_rounded,
              title: intl.audio_config_btn_rain,
              isSelected: selectedAudio?.contains('rain') ?? false,
            ),
            ElevatedButton(
              onPressed: () {
                widget.updatePlayerAsset(selectedAudio);

                Navigator.of(context).pop();
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
              ),
              child: Text(
                intl.audio_config_btn_save,
                style: Theme.of(
                  context,
                ).textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
