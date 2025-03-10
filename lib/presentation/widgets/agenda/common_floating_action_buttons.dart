import 'package:flutter/material.dart';

import 'package:xpeapp_admin/data/colors.dart';

class CommonFloatingActionButtons extends StatelessWidget {
  final VoidCallback onCreate;
  final VoidCallback onRefresh;

  const CommonFloatingActionButtons({
    super.key,
    required this.onCreate,
    required this.onRefresh,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Tooltip(
          message: "Recharger",
          child: FloatingActionButton(
            onPressed: onRefresh,
            backgroundColor: kDefaultXpehoColor,
            child: const Icon(
              Icons.refresh,
              color: Colors.white,
            ),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Tooltip(
          message: 'Créer',
          child: FloatingActionButton(
            onPressed: onCreate,
            backgroundColor: kDefaultXpehoColor,
            child: const Icon(
              Icons.add,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
