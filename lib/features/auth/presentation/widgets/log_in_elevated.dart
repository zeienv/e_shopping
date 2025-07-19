import 'package:flutter/material.dart';

class LogInElevated extends StatelessWidget {
  String? text;
  final VoidCallback onPressed;
  LogInElevated({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.deepPurpleAccent,
        minimumSize: const Size(double.infinity, 52),
      ),
      onPressed: onPressed,
      child: Center(
        child: Text(text!,
        style: const TextStyle(color: Colors.white),),
      ),
    );
  }
}
