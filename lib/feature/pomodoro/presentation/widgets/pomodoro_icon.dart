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
      style: const ButtonStyle(
        iconSize: WidgetStatePropertyAll(45),
        side: WidgetStatePropertyAll(BorderSide(color: Colors.black)),
      ),
    );
  }
}
