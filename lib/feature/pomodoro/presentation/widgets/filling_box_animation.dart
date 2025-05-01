part of '../screen/pomodoro_page.dart';

class _FillingBoxAnimation extends StatelessWidget {
  const _FillingBoxAnimation();

  @override
  Widget build(BuildContext context) {
    return BlocSelector<PomodoroBloc, PomodoroState, Duration>(
      selector: (state) => state.timer,
      builder: (context, timer) {
        final totalSeconds = const Duration(minutes: 25).inSeconds;
        final currentSeconds = totalSeconds - timer.inSeconds;

        return Column(
          spacing: 10,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox.square(
              dimension: 200,
              child: CustomPaint(
                painter: RainbowCircularProgress(
                  totalSeconds: totalSeconds,
                  currentSeconds: currentSeconds,
                  baseColor: Theme.of(context).primaryColor,
                ),
              ),
            ),

            Text(
              '${timer.inSeconds ~/ 60}:${timer.inSeconds.remainder(60)}',
              style: Theme.of(context).textTheme.displayMedium,
            ),
          ],
        );
      },
    );
  }
}

class RainbowCircularProgress extends CustomPainter {
  final int totalSeconds;
  final int currentSeconds;
  final Color baseColor;

  RainbowCircularProgress({
    required this.totalSeconds,
    required this.currentSeconds,
    required this.baseColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = math.min(size.width, size.height) / 2;

    // 1. Draw the background circle
    final backgroundPaint =
        Paint()
          ..color = baseColor.withAlpha(100)
          ..style = PaintingStyle.stroke
          ..strokeWidth = 10.0;
    canvas.drawCircle(center, radius, backgroundPaint);

    // 2. Calculate the sweep angle for the progress
    final sweepAngle = 2 * math.pi * (currentSeconds / totalSeconds);

    // 3. Create the rainbow gradient shader
    final gradient = const SweepGradient(
      startAngle: -math.pi / 2, // Start at the top
      endAngle: 3 * math.pi / 2, // Sweep 360 degrees
      colors: [
        Colors.red,
        Colors.orange,
        Colors.yellow,
        Colors.green,
        Colors.blue,
        Colors.indigo,
        Colors.purple,
        Colors.red, // Loop back to red for a continuous rainbow
      ],
      stops: [0.0, 0.14, 0.28, 0.42, 0.57, 0.71, 0.85, 1.0],
    );

    // 4. Create the paint for the arc with the shader
    final foregroundPaint =
        Paint()
          ..style = PaintingStyle.stroke
          ..strokeWidth = 10.0
          ..strokeCap = StrokeCap.round
          ..shader = gradient.createShader(
            Rect.fromCircle(center: center, radius: radius),
          );

    // 5. Draw the foreground arc
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -math.pi / 2, // Start at the top
      sweepAngle,
      false, // Don't connect the ends
      foregroundPaint,
    );
  }

  @override
  bool shouldRepaint(covariant RainbowCircularProgress oldDelegate) {
    return oldDelegate.currentSeconds != currentSeconds ||
        oldDelegate.totalSeconds != totalSeconds ||
        oldDelegate.baseColor != baseColor;
  }
}
