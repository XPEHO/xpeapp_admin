import 'package:flutter/material.dart';
import 'package:xpeapp_admin/data/colors.dart';

class AgendaFormElevatedButton extends StatelessWidget {
  final bool isEnabled;
  final VoidCallback onPressed;
  final String buttonText;

  const AgendaFormElevatedButton({
    super.key,
    required this.isEnabled,
    required this.onPressed,
    required this.buttonText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 30, bottom: 30, left: 50),
      width: 200,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: kDefaultXpehoColor,
        ),
        onPressed: isEnabled ? onPressed : null,
        child: Text(buttonText),
      ),
    );
  }
}
