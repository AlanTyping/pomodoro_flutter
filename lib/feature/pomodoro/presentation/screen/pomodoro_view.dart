part of './pomodoro_page.dart';

class _PomodoroView extends StatefulWidget {
  const _PomodoroView();

  @override
  State<_PomodoroView> createState() => _PomodoroViewState();
}

class _PomodoroViewState extends State<_PomodoroView> {
  final titleController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool hasStarted = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.info),
          iconSize: 25,
          onPressed: () {
            // Acción izquierda
          },
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(TaskHistoryPage.route());
            },
            icon: const Icon(Icons.article, size: 40),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: BlocBuilder<PomodoroBloc, PomodoroState>(
            builder: (context, state) {
              final bloc = context.read<PomodoroBloc>();

              final buttons = Row(
                spacing: 20,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Transform(
                    transform: Matrix4.translationValues(0, -40, 0),
                    child: PomodoroIcon(
                      icon: Icons.play_arrow,
                      onPressed: () => bloc.add(const ResumePomodoro()),
                    ),
                  ),
                  PomodoroIcon(
                    icon: Icons.pause,
                    onPressed: () => bloc.add(const PausePomodoro()),
                  ),
                  PomodoroIcon(
                    icon: Icons.stop,
                    onPressed: () => bloc.add(const StopPomodoro()),
                  ),
                  Transform(
                    transform: Matrix4.translationValues(0, -40, 0),
                    child: PomodoroIcon(
                      icon: Icons.skip_next,
                      onPressed: () => bloc.add(const SkipCyclePomodoro()),
                    ),
                  ),
                ],
              );

              final isInitialState =
                  !state.isRunning &&
                  state.cycle == Cycle.first &&
                  state.title == null;

              if (isInitialState) {
                return Form(
                  key: formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextFormField(
                        controller: titleController,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.all(20),
                          hintText: 'New task',
                          hintStyle: const TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                          enabledBorder: _border(Colors.grey),
                          border: _border(Colors.black),
                          focusedBorder: _border(Colors.black),
                          errorBorder: _border(Colors.red),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Add task!';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 25),
                      ElevatedButton(
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            bloc.add(UpdateTitlePomodoro(titleController.text));
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          fixedSize: const Size(400, 60),
                          backgroundColor: const Color.fromARGB(
                            221,
                            37,
                            37,
                            37,
                          ),
                          padding: const EdgeInsets.all(20),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: Text(
                          'Add',
                          style: Theme.of(
                            context,
                          ).textTheme.bodyLarge?.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(height: 100),
                    ],
                  ),
                );
              } else {
                return Column(
                  spacing: 20,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      state.title ?? '',
                      style: const TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(221, 37, 37, 37),
                      ),
                    ),
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          width: 300,
                          height: 300,
                          clipBehavior: Clip.hardEdge,
                          decoration: const BoxDecoration(
                            color: Color(0x4D8DC5FE),
                            shape: BoxShape.circle,
                          ),
                          child: const FillingBoxAnimation(
                            cycle: Cycle.fourth,
                            color: Color(0xFF8DC5FE),
                          ),
                        ),
                        Container(
                          width: 225,
                          height: 225,
                          clipBehavior: Clip.hardEdge,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color(0x4D659FFF),
                            // border: const Border.fromBorderSide(
                            //   BorderSide(color: Colors.white, width: 2),
                            // ),
                          ),
                          child: const FillingBoxAnimation(
                            cycle: Cycle.third,
                            color: Color(0xFF659FFF),
                          ),
                        ),
                        Container(
                          width: 155,
                          height: 155,
                          clipBehavior: Clip.hardEdge,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color(0x4D3F79FF),
                            // border: const Border.fromBorderSide(
                            //   BorderSide(color: Colors.white, width: 2),
                            // ),
                          ),
                          child: const FillingBoxAnimation(
                            cycle: Cycle.second,
                            color: Color(0xFF3F79FF),
                          ),
                        ),
                        Container(
                          width: 85,
                          height: 85,
                          clipBehavior: Clip.hardEdge,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color(0x4D1852FE),
                          ),
                          child: const FillingBoxAnimation(
                            cycle: Cycle.first,
                            color: Color(0xFF1852FE),
                          ),
                        ),
                      ],
                    ),
                    TimerText(actualClock: state.timer),
                    !hasStarted
                        ? ElevatedButton(
                          onPressed: () {
                            setState(() {
                              hasStarted = true;
                            });
                            bloc.add(const StartPomodoro());
                          },
                          style: ElevatedButton.styleFrom(
                            fixedSize: const Size(200, 60),
                            backgroundColor: const Color.fromARGB(
                              221,
                              37,
                              37,
                              37,
                            ),
                            padding: const EdgeInsets.all(20),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: Text(
                            'Start',
                            style: Theme.of(
                              context,
                            ).textTheme.bodyLarge?.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        )
                        : buttons,
                  ],
                );
              }
              // final isInitialState = state.isRunning && state.
            },
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    titleController.dispose();
  }

  static OutlineInputBorder _border(Color color) => OutlineInputBorder(
    borderSide: BorderSide(color: color, width: 3.0),
    borderRadius: BorderRadius.circular(10),
  );
}
