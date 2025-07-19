import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignInWidget extends StatelessWidget {
  final String text;
  final TextEditingController controller;
  final TextInputType? keyboardType;

  const SignInWidget({
    super.key,
    required this.text,
    required this.controller,
    this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white10,
        labelText: text,
        border: InputBorder.none,
        labelStyle: const TextStyle(color: Colors.white),
      ),
      validator: (String? value) {
        if (value == null || value.isEmpty) {
          return 'This field cannot be empty';
        }
        return null;
      },
    );
  }
}
