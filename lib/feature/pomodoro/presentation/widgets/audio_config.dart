import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:pomodoro_flutter/feature/pomodoro/presentation/widgets/ui/audio_config_button.dart';

class AudioConfig extends StatelessWidget {
  final VoidCallback onPress;
  const AudioConfig({super.key, required this.onPress});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 60),
      child: Center(
        child: Transform.translate(
          offset: const Offset(0, -50),
          child: Container(
            height: 500,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: colorScheme.primary,
            ),
            child: Column(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(32),
                    child: Column(
                      spacing: 23,
                      children: [
                        AudioConfigButton(
                          backgroundColor: colorScheme.surface,
                          icon: Icons.music_off_rounded,
                          iconColor: colorScheme.surface,
                          iconBackgroundColor: colorScheme.error,
                          title: "sin audio",
                          titleColor: colorScheme.error,
                        ),
                        Container(
                          width: double.infinity,
                          height: 2,
                          color: Colors.white,
                        ),
                        AudioConfigButton(
                          backgroundColor: colorScheme.surface,
                          icon: Icons.local_fire_department,
                          iconColor: colorScheme.surface,
                          iconBackgroundColor: colorScheme.primary,
                          title: "fuego",
                          titleColor: colorScheme.primary,
                        ),
                        AudioConfigButton(
                          backgroundColor: colorScheme.surface,
                          icon: Icons.water_drop,
                          iconColor: colorScheme.surface,
                          iconBackgroundColor: colorScheme.primary,
                          title: "goteo",
                          titleColor: colorScheme.primary,
                        ),
                        AudioConfigButton(
                          backgroundColor: colorScheme.surface,
                          icon: Icons.cloudy_snowing,
                          iconColor: colorScheme.surface,
                          iconBackgroundColor: colorScheme.primary,
                          title: "lluvia",
                          titleColor: colorScheme.primary,
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: onPress,
                  child: Container(
                    width: double.infinity,
                    height: 70,
                    decoration: BoxDecoration(
                      color: colorScheme.onPrimary,
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        "guardar",
                        style: Theme.of(
                          context,
                        ).textTheme.displaySmall!.copyWith(
                          fontSize: 20,
                          color: colorScheme.surface,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ).animate().slide(begin: const Offset(0, 1), duration: .18.seconds); //
  }
}
