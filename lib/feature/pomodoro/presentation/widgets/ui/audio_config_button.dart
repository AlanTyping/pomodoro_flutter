// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class AudioConfigButton extends StatelessWidget {
  final Color backgroundColor;
  final IconData icon;
  final Color iconColor;
  final Color iconBackgroundColor;
  final String title;
  final Color titleColor;

  const AudioConfigButton({
    super.key,
    required this.backgroundColor,
    required this.icon,
    required this.iconColor,
    required this.iconBackgroundColor,
    required this.title,
    required this.titleColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: backgroundColor,
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            IconButton.outlined(
              onPressed: () {},
              icon: Icon(icon, color: iconColor),
            ),
            Text(title, style: TextStyle(color: titleColor)),
          ],
        ),
      ),
    );
  }
}
