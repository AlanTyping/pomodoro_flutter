import 'package:flutter/material.dart';

class InformationScreen extends StatelessWidget {
  const InformationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final bodyMedium = textTheme.bodyMedium!.copyWith(
      color: theme.primary,
      fontWeight: FontWeight.bold,
    );

    return Dialog(
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: theme.surface,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            AppBar(),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Text(
                    "Pomodoro project",
                    style: Theme.of(
                      context,
                    ).textTheme.titleLarge!.copyWith(color: theme.primary),
                  ),
                  Text(
                    "Integrantes",
                    style: textTheme.titleMedium!.copyWith(
                      color: theme.primary,
                    ),
                  ),
                  Text("Anthony", style: bodyMedium),
                  Text("Junior", style: bodyMedium),
                  Text("Alan", style: bodyMedium),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
