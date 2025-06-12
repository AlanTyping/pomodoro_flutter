import 'package:flutter/material.dart';
import 'package:pomodoro_flutter/core/core.dart';
import 'package:pomodoro_flutter/feature/pomodoro/view/screen/pomodoro_page.dart';
import 'package:pomodoro_flutter/l10n/l10n.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    final brightness = View.of(context).platformDispatcher.platformBrightness;
    PomodoroTheme theme = PomodoroTheme(
      createTextTheme(context, 'Poppins', 'Alike'),
    );

    return MaterialApp(
      theme: brightness == Brightness.dark ? theme.dark() : theme.light(),
      onGenerateTitle: (context) => AppLocalizations.of(context)!.app_name,
      home: const PomodoroPage(),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
    );
  }
}
