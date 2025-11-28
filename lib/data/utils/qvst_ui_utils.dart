import 'package:flutter/material.dart';

class QvstInfoBanner extends StatelessWidget {
  final String text;
  final Color color;
  final IconData icon;
  const QvstInfoBanner({
    super.key,
    required this.text,
    this.color = const Color(0xFFE3F2FD),
    this.icon = Icons.info_outline,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: color.withAlpha(150)),
      ),
      child: Row(
        children: [
          Icon(icon, color: Colors.blue.shade700, size: 20),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              text,
              style: TextStyle(color: Colors.blue.shade900, fontSize: 12),
            ),
          ),
        ],
      ),
    );
  }
}

class QvstAlertBox extends StatelessWidget {
  final String text;
  const QvstAlertBox({super.key, required this.text});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 16),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.red.shade50,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.red.shade300),
      ),
      child: Row(
        children: [
          Icon(Icons.warning, color: Colors.red.shade700),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                color: Colors.red.shade900,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class QvstLegendItem extends StatelessWidget {
  final Color color;
  final String label;
  const QvstLegendItem({super.key, required this.color, required this.label});
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(width: 16, height: 16, color: color),
        const SizedBox(width: 8),
        Text(label),
      ],
    );
  }
}
