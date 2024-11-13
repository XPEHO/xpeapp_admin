import 'package:flutter/material.dart';

Widget subtitleWidget(String title) {
  return Container(
    alignment: Alignment.center,
    padding: const EdgeInsets.only(
      left: 16,
      right: 16,
      top: 16,
      bottom: 8,
    ),
    child: Text(
      title,
      textAlign: TextAlign.center,
      style: const TextStyle(
        fontSize: 14,
        fontStyle: FontStyle.italic,
      ),
    ),
  );
}
