part of './pomodoro_page.dart';

class _PomodoroView extends StatefulWidget {
  const _PomodoroView();

  @override
  State<_PomodoroView> createState() => _PomodoroViewState();
}

class _PomodoroViewState extends State<_PomodoroView> {
  final titleController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    super.dispose();
    titleController.dispose();
  }

  static _border(Color color) => OutlineInputBorder(
    borderSide: BorderSide(color: color, width: 3.0),
    borderRadius: BorderRadius.circular(10),
  );

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
            onPressed: () {},
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
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      PomodoroIcon(
                        icon: Icons.play_arrow,
                        onPressed: () => bloc.add(const StartPomodoro()),
                      ),
                      const SizedBox(height: 45),
                    ],
                  ),
                  const SizedBox(width: 20),
                  PomodoroIcon(
                    icon: Icons.pause,
                    onPressed: () => bloc.add(const PausePomodoro()),
                  ),
                  const SizedBox(width: 20),
                  PomodoroIcon(
                    icon: Icons.stop,
                    onPressed: () => bloc.add(const StopPomodoro()),
                  ),
                  const SizedBox(width: 20),
                  Column(
                    children: [
                      PomodoroIcon(
                        icon: Icons.skip_next,
                        onPressed: () => bloc.add(const SkipCyclePomodoro()),
                      ),
                      const SizedBox(height: 45),
                    ],
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
                        onChanged: (nombre) {
                          bloc.add(UpdateTitlePomodoro(nombre));
                        },
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(20),
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
                        obscuringCharacter: '*',
                      ),
                      const SizedBox(height: 25),
                      ElevatedButton(
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            bloc.add(const StartPomodoro());
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          fixedSize: const Size(400, 60),
                          backgroundColor: Colors.black,
                          shadowColor: Colors.transparent,
                          padding: const EdgeInsets.all(20),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: Text(
                          "Start",
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
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      state.title ?? '',
                      style: const TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 100),
                    Container(
                      width: 300,
                      height: 300,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color:
                            state.cycle.index == Cycle.first.index
                                ? Colors.lightBlue
                                : Colors.blueAccent,
                        border: const Border.fromBorderSide(
                          BorderSide(color: Colors.black, width: 2),
                        ),
                      ),
                      child: Center(
                        child: Container(
                          width: 225,
                          height: 225,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.transparent,
                            border: Border.fromBorderSide(
                              BorderSide(color: Colors.black, width: 2),
                            ),
                          ),
                          child: Center(
                            child: Container(
                              width: 155,
                              height: 155,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.transparent,
                                border: Border.fromBorderSide(
                                  BorderSide(color: Colors.black, width: 2),
                                ),
                              ),
                              child: Center(
                                child: Container(
                                  width: 85,
                                  height: 85,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.transparent,
                                    border: Border.fromBorderSide(
                                      BorderSide(color: Colors.black, width: 2),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    TimerText(actualClock: state.timer),
                    const SizedBox(height: 150),
                    buttons,
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
}
