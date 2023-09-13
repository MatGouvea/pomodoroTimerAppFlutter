import 'package:flutter/material.dart';
import 'package:pomodoro_timer/components/pomodoro.dart';
import 'package:pomodoro_timer/store/pomodoro.store.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<PomodoroStore>(
          create: (_) => PomodoroStore(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Pomodoro Timer App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const Pomodoro(),
      ),
    );
  }
}
