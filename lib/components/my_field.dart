import 'package:flutter/material.dart';

class MyField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool isObscure;
  const MyField(
      {super.key,
      required this.controller,
      required this.hintText,
      required this.isObscure});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    return TextField(
      controller: controller,
      obscureText: isObscure,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(color: theme.primary),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: theme.tertiary,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: theme.primary,
          ),
        ),
      ),
    );
  }
}
