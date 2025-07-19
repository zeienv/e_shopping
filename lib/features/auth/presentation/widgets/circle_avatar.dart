import 'package:flutter/material.dart';


Widget circleAvatar(String imgUrl, String text) {
  return Column(
    children: [
      CircleAvatar(

        backgroundImage: AssetImage(imgUrl),
        radius: 40,
      ),
      const SizedBox(height: 8), // Space between avatar and text
      Text(
        text,
        style: const TextStyle(color: Colors.white), // Optional text styling
      ),
    ],
  );
}