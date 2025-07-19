import 'package:flutter/material.dart';

class CustomClip extends StatelessWidget {
  final String imgURL;

  const CustomClip({
    super.key,
    required this.imgURL,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 7),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(

            ),
            child: Image.asset(
              imgURL,
              width: 161,
              height: 248,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}
