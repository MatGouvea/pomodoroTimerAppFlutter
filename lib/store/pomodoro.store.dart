import 'package:mobx/mobx.dart';
import 'dart:async';
part 'pomodoro.store.g.dart';

class PomodoroStore = _PomodoroStore with _$PomodoroStore;

enum BreakType { work, rest }

abstract class _PomodoroStore with Store {
  @observable
  bool initiated = false;

  @observable
  int minutes = 2;

  @observable
  int seconds = 0;

  @observable
  int workTime = 2;

  @observable
  int restTime = 1;

  BreakType breakType = BreakType.work;

  Timer? timer;

  @action
  void init() {
    initiated = true;
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (minutes == 0 && seconds == 0) {
        _changeBreakType();
      } else if (seconds == 0) {
        seconds = 59;
        minutes--;
      } else {
        seconds--;
      }
    });
  }

  @action
  void restart() {
    stop();
    minutes = isWorking() ? workTime : restTime;
    seconds = 0;
  }

  @action
  void stop() {
    initiated = false;
    timer?.cancel();
  }

  @action
  void incrementWorkTime() {
    workTime++;
    if (isWorking()) {
      restart();
    }
  }

  @action
  void incrementRestTime() {
    restTime++;
    if (isResting()) {
      restart();
    }
  }

  @action
  void decrementWorkTime() {
    if (workTime > 1) {
      workTime--;
      if (isWorking()) {
        restart();
      }
    }
  }

  @action
  void decrementRestTime() {
    if (restTime > 1) {
      restTime--;
      if (isResting()) {
        restart();
      }
    }
  }

  bool isWorking() {
    return breakType == BreakType.work;
  }

  bool isResting() {
    return breakType == BreakType.rest;
  }

  void _changeBreakType() {
    if (isWorking()) {
      breakType = BreakType.rest;
      minutes = restTime;
    } else {
      breakType = BreakType.work;
      minutes = workTime;
    }
    seconds = 0;
  }
}
