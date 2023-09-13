// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'timer.store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$TimerStore on _TimerStore, Store {
  late final _$timerAtom = Atom(name: '_TimerStore.timer', context: context);

  @override
  int get timer {
    _$timerAtom.reportRead();
    return super.timer;
  }

  @override
  set timer(int value) {
    _$timerAtom.reportWrite(value, super.timer, () {
      super.timer = value;
    });
  }

  late final _$_TimerStoreActionController =
      ActionController(name: '_TimerStore', context: context);

  @override
  void increment() {
    final _$actionInfo = _$_TimerStoreActionController.startAction(
        name: '_TimerStore.increment');
    try {
      return super.increment();
    } finally {
      _$_TimerStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
timer: ${timer}
    ''';
  }
}
