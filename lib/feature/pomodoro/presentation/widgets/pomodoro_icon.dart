import 'package:flutter/material.dart';

class PomodoroIcon extends StatelessWidget {
  final IconData icon;
  final void Function() onPressed;

  const PomodoroIcon({super.key, required this.icon, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: Icon(icon),
      iconSize: 45,
      color: Theme.of(context).colorScheme.primary,
    );
  }
}
