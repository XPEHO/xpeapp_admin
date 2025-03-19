import 'package:flutter/material.dart';

class AgendaSummaryTile extends StatelessWidget {
  final String title;
  final IconData leadingIcon;
  final IconData? trailingIcon;
  final VoidCallback? onTap;

  const AgendaSummaryTile({
    super.key,
    required this.title,
    required this.leadingIcon,
    this.trailingIcon,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      tileColor: Colors.white,
      style: ListTileStyle.list,
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      leading: Icon(leadingIcon),
      trailing: trailingIcon != null ? Icon(trailingIcon) : null,
      onTap: onTap,
    );
  }
}
