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

    return TextButton.icon(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        backgroundColor: colorScheme.secondaryContainer,
        foregroundColor: colorScheme.onSecondaryContainer,
        iconColor: colorScheme.onSecondaryContainer,
        iconSize: 30,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        padding: const EdgeInsets.all(8),
        minimumSize: const Size.fromHeight(20),
      ),
      icon: CircleAvatar(
        backgroundColor: colorScheme.secondaryContainer,
        child: Icon(icon),
      ),

      label: Text(
        title,
        style: Theme.of(
          context,
        ).textTheme.labelLarge?.copyWith(fontWeight: FontWeight.bold),
      ),
    );
  }
}
