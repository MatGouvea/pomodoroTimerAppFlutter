import 'package:flutter/material.dart';
import 'package:pomodoro_timer/components/timer.dart';
import 'package:pomodoro_timer/store/pomodoro.store.dart';
import 'package:provider/provider.dart';
import 'entry_time.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class Pomodoro extends StatelessWidget {
  const Pomodoro({super.key});

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<PomodoroStore>(context);

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Expanded(child: Timer()),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 40),
            child: Observer(builder: (_) => Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                EntryTime(
                  title: 'Trabalho',
                  value: store.workTime,
                  inc: store.initiated && store.isWorking() ? null : store.incrementWorkTime,
                  dec: store.initiated && store.isWorking() ? null : store.decrementWorkTime,
                ),
                EntryTime(
                  title: 'Descanso',
                  value: store.restTime,
                  inc: store.initiated && store.isResting() ? null : store.incrementRestTime,
                  dec: store.initiated && store.isResting() ? null : store.decrementRestTime,
                ),
              ],
            ),)
          ),
        ],
      ),
    );
  }
}
