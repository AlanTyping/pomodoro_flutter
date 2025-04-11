import 'package:flutter/material.dart';

class TimerText extends StatelessWidget {
  final Duration actualClock;

  const TimerText({super.key, required this.actualClock});

  @override
  Widget build(BuildContext context) {
    return Text(
      _formatDuration(actualClock),
      style: Theme.of(context).textTheme.displayMedium?.copyWith(
        fontWeight: FontWeight.bold,
        color: const Color.fromARGB(221, 37, 37, 37),
      ),
    );
  }

  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return '$minutes:$seconds';
  }
}
