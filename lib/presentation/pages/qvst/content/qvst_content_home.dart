import 'package:flutter/material.dart';
import 'package:xpeapp_admin/data/colors.dart';

class QvstContentHome extends StatelessWidget {
  const QvstContentHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text(
          'Bienvenue dans la partie QVST',
          style: TextStyle(
            color: kDefaultXpehoColor,
            fontSize: 30,
            fontFamily: 'SF Pro Rounded',
          ),
        ),
        const SizedBox(height: 20),
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image.asset(
            "assets/images/qvst_picture.jpg",
            width: 600,
            fit: BoxFit.cover,
          ),
        ),
      ],
    );
  }
}
