// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class AudioConfigButton extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onPressed;
  const AudioConfigButton({
    super.key,
    required this.icon,
    required this.title,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final brightnessDark =
        View.of(context).platformDispatcher.platformBrightness ==
                Brightness.dark
            ? true
            : false;

    return TextButton.icon(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        alignment: Alignment.centerLeft,
        backgroundColor:
            brightnessDark ? colorScheme.onPrimary : colorScheme.surface,
        foregroundColor: colorScheme.onSecondaryContainer,
        iconColor: colorScheme.onSecondaryContainer,
        iconSize: 30,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        padding: const EdgeInsets.only(left: 16, top: 12, bottom: 12),
        minimumSize: const Size.fromHeight(20),
      ),
      icon: CircleAvatar(
        backgroundColor:
            brightnessDark ? colorScheme.inverseSurface : colorScheme.primary,
        child: Icon(
          icon,
          color: brightnessDark ? colorScheme.onPrimary : colorScheme.surface,
        ),
      ),
      label: Padding(
        padding: const EdgeInsets.only(left: 12),
        child: Text(
          title,
          style: Theme.of(context).textTheme.labelLarge?.copyWith(
            fontWeight: FontWeight.bold,
            color:
                brightnessDark
                    ? colorScheme.inverseSurface
                    : colorScheme.primary,
          ),
        ),
      ),
    );
  }
}
