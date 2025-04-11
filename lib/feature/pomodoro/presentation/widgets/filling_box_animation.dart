import 'package:flutter/material.dart';

class FillingBoxAnimation extends StatefulWidget {
  final Duration duration;
  final Color color;
  const FillingBoxAnimation({
    super.key,
    required this.duration,
    required this.color,
  });

  @override
  State<FillingBoxAnimation> createState() => _FillingBoxAnimationState();
}

class _FillingBoxAnimationState extends State<FillingBoxAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: widget.duration)
      ..forward(); // empieza la animación automáticamente
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return FractionallySizedBox(
          alignment: Alignment.bottomCenter,
          heightFactor: _controller.value, // de 0 a 1
          child: Container(
            decoration: BoxDecoration(
              color: widget.color,
              borderRadius: BorderRadius.circular(0),
            ),
          ),
        );
      },
    );
  }
}
