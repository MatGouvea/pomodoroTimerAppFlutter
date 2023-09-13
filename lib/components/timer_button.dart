// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';

class TimerButton extends StatelessWidget {
  final String text;
  final IconData icon;
  final void Function()? click;

  const TimerButton({
    required this.text,
    required this.icon,
    this.click,
  });

  @override
  Widget build(BuildContext context) {

    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          backgroundColor: Colors.black,
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
          textStyle: const TextStyle(fontSize: 25)),
      onPressed: click,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Icon(
              icon,
              size: 35,
            ),
          ),
          Text(text)
        ],
      ),
    );
  }
}
