import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pomodoro_flutter/feature/pomodoro/presentation/bloc/pomodoro_bloc.dart';
import 'package:pomodoro_flutter/feature/pomodoro/presentation/bloc/pomodoro_event.dart';
import 'package:pomodoro_flutter/feature/pomodoro/presentation/bloc/pomodoro_state.dart';
import 'package:pomodoro_flutter/feature/task/domain/entities/task_entities.dart';

class FillingBoxAnimation extends StatefulWidget {
  final Duration duration;
  final Cycle cycle;
  final Color color;
  const FillingBoxAnimation({
    super.key,
    required this.duration,
    required this.cycle,
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
    _controller = AnimationController(vsync: this, duration: widget.duration);
    //  ..forward(); // empieza la animación automáticamente
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<PomodoroBloc, PomodoroState>(
      listener: (context, state) {
        if (state.cycle == widget.cycle) {
          if (!state.isRunning) {
            _controller.stop();
          } else {
            _controller.forward();
          }
        }
      },
      child: AnimatedBuilder(
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
      ),
    );
  }
}
