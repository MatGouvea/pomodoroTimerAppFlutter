import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pomodoro_timer/store/pomodoro.store.dart';
import 'package:provider/provider.dart';
import 'timer_button.dart';

class Timer extends StatelessWidget {
  const Timer({super.key});

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<PomodoroStore>(context);

    return Observer(builder: (_) {
      return Container(
        color: store.isWorking() ? Colors.red : Colors.green,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              store.isWorking() ? 'Hora de Trabalhar' : 'Hora de Descansar',
              style: const TextStyle(fontSize: 40, color: Colors.white),
            ),
            const SizedBox(height: 20),
            Text(
              '${store.minutes.toString().padLeft(2, '0')}:${store.seconds.toString().padLeft(2, '0')}',
              style: const TextStyle(fontSize: 120, color: Colors.white),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (!store.initiated)
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: TimerButton(
                      text: 'Iniciar',
                      icon: Icons.play_arrow,
                      click: store.init,
                    ),
                  ),
                if (store.initiated)
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: TimerButton(
                      text: 'Parar',
                      icon: Icons.stop,
                      click: store.stop,
                    ),
                  ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: TimerButton(
                    text: 'Reiniciar',
                    icon: Icons.refresh,
                    click: store.restart,
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    });
  }
}
