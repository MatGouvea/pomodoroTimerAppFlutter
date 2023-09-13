import 'package:mobx/mobx.dart';
part 'timer.store.g.dart';

class TimerStore = _TimerStore with _$TimerStore;

abstract class _TimerStore with Store {
  @observable
  int timer = 0;

  @action
  void increment(){
    timer++;
  }
}