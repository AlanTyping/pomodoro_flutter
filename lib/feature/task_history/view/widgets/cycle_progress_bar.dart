import 'package:flutter/material.dart';

class CycleProgressBar extends StatelessWidget {
  final double? percentage;

  const CycleProgressBar({required this.percentage, super.key});

  @override
  Widget build(BuildContext context) {
    Icon icon;
    if (percentage == 1.0) {
      icon = const Icon(Icons.check, color: Colors.green);
    } else if (percentage == 0.0) {
      icon = const Icon(Icons.close, color: Colors.red);
    } else {
      icon = const Icon(Icons.restore_outlined, color: Colors.grey);
    }

    return Stack(
      children: [
        ColoredBox(
          color: Theme.of(context).colorScheme.secondaryContainer,
          child: const SizedBox(height: 50),
        ),
        FractionallySizedBox(
          widthFactor: percentage,
          alignment: Alignment.centerLeft,
          child: const ColoredBox(
            color: Colors.green,
            child: SizedBox(height: 50),
          ),
        ),
        Positioned.fill(
          child: Align(alignment: Alignment.center, child: Card(child: icon)),
        ),
      ],
    );
  }
}
