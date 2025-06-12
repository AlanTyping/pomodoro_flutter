// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class AudioConfigButton extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onPressed;
  final bool isSelected;

  const AudioConfigButton({
    super.key,
    required this.icon,
    required this.title,
    required this.onPressed,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return TextButton.icon(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        alignment: Alignment.centerLeft,
        backgroundColor:
            isSelected
                ? colorScheme.primaryContainer
                : colorScheme.secondaryContainer,
        foregroundColor: colorScheme.onSecondaryContainer,
        iconColor: colorScheme.onSecondaryContainer,
        iconSize: 30,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        padding: const EdgeInsets.only(left: 16, top: 12, bottom: 12),
        minimumSize: const Size.fromHeight(20),
      ),
      icon: CircleAvatar(child: Icon(icon)),
      label: Padding(
        padding: const EdgeInsets.only(left: 12),
        child: Text(
          title,
          style: Theme.of(
            context,
          ).textTheme.labelLarge?.copyWith(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
