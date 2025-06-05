import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:just_audio/just_audio.dart';
import 'package:pomodoro_flutter/core/utils/show_snackbar.dart';
import 'package:pomodoro_flutter/feature/information/view/screen/information_page.dart';
import 'package:pomodoro_flutter/feature/pomodoro/view/bloc/pomodoro_bloc.dart';
import 'package:pomodoro_flutter/feature/pomodoro/view/bloc/pomodoro_state.dart';
import 'package:pomodoro_flutter/feature/pomodoro/view/widgets/audio_config.dart';
import 'package:pomodoro_flutter/feature/task_history/view/screen/task_history_page.dart';
import 'package:pomodoro_flutter/l10n/l10n.dart';

part '../widgets/action_buttons.dart';
part '../widgets/filling_box_animation.dart';
part '../widgets/sphere_painter.dart';
part './pomodoro_view.dart';

class PomodoroPage extends StatelessWidget {
  const PomodoroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context) => PomodoroBloc(), child: const _PomodoroView());
  }
}
