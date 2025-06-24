import 'package:flutter/material.dart';
import 'package:pomodoro_flutter/l10n/l10n.dart';

part 'information_view.dart';

final class InformationPage extends StatelessWidget {
  const InformationPage({super.key});

  static Route route() => PageRouteBuilder(
    pageBuilder: (context, animation, secondAnimation) => const InformationPage(),
  );

  @override
  Widget build(BuildContext context) {
    return const _InformationView();
  }
}
