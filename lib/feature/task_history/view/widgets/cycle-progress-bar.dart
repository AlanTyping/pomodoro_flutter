import 'package:flutter/material.dart';

class CycleProgressBar extends StatelessWidget {
  final double percentage;

  const CycleProgressBar({required this.percentage, super.key});

  @override
  Widget build(BuildContext context) {
    IconData icon;
    if (percentage == 1.0) {
      icon = Icons.check;
    } else if (percentage == 0.0) {
      icon = Icons.close;
    } else {
      icon = Icons.restore_outlined;
    }

    return Expanded(
      child: Stack(
        children: [
          Container(height: 50, color: const Color.fromARGB(73, 158, 158, 158)),
          FractionallySizedBox(
            widthFactor: percentage,
            alignment: Alignment.centerLeft,
            child: Container(
              height: 50,
              color: const Color.fromARGB(125, 76, 51, 187),
            ),
          ),
          Positioned.fill(
            child: Align(
              alignment: Alignment.center,
              child: Container(
                height: 30,
                width: 30,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Positioned.fill(
            child: Align(
              alignment: Alignment.center,
              child: Icon(icon, color: const Color.fromARGB(125, 76, 51, 187)),
            ),
          ),
        ],
      ),
    );
  }
}
