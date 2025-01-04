import 'package:flutter/material.dart';

class CustButton extends StatelessWidget {
  final Function()? onTap;
  final String text;
  const CustButton({super.key, this.onTap, required this.text});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: theme.secondary,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
                color: theme.inversePrimary, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
