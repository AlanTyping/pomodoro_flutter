import 'package:flutter/material.dart';
import 'package:pomodoro_flutter/core/core.dart';

import 'feature/pomodoro/presentation/screen/pomodoro_page.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    final brightness = View.of(context).platformDispatcher.platformBrightness;
    PomodoroTheme theme = PomodoroTheme(
      createTextTheme(context, 'Nokora', 'Alike'),
    );

    return MaterialApp(
      title: 'Pomodoro Flutter',
      theme: brightness == Brightness.dark ? theme.dark() : theme.light(),
      home: const PomodoroPage(),
    );
  }
}
