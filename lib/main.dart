import 'package:flutter/material.dart';
import 'package:pomodoro_flutter/feature/pomodoro/presentation/pages/pomodoro_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: PomodoroPage());
  }
}
