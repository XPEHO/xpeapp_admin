import 'package:flutter/material.dart';

class AgendaFormLabel extends StatelessWidget {
  final String text;
  final double size;
  final Color color;

  const AgendaFormLabel({
    super.key,
    required this.text,
    this.size = 16,
    this.color = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5),
      child: Text(
        text,
        style: TextStyle(
          fontSize: size,
          fontWeight: FontWeight.bold,
          color: color,
        ),
      ),
    );
  }
}
