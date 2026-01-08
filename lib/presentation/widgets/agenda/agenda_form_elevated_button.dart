import 'package:flutter/material.dart';
import 'package:yaki_ui/yaki_ui.dart';

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
      margin: const EdgeInsets.only(top: 30, bottom: 100),
      width: MediaQuery.of(context).size.width * 0.5,
      child: Button.secondary(
        text: buttonText,
        onPressed: isEnabled ? onPressed : null,
      ),
    );
  }
}
