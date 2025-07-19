
import 'package:flutter/material.dart';

class Heart extends StatelessWidget {
  final VoidCallback onPressed;
  final String? imgURL;
  const Heart({super.key, required this.onPressed, required this.imgURL});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.zero,
        backgroundColor: Colors.white10,
        minimumSize: const Size(40, 40),
      ),
      onPressed: onPressed,
      child: Image.asset(
        imgURL!,
        height: 40,
        width: 40,

      ),
    );
  }
}
