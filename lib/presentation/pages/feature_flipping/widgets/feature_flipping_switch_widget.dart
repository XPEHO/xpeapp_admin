import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

enum FeatureFlippingType { uat, prod }

class FeatureFlippingSwitchWidget extends ConsumerWidget {
  final FeatureFlippingType type;
  final String featureId;
  final bool featureEnabled;
  final bool isActivated;

  const FeatureFlippingSwitchWidget({
    super.key,
    required this.type,
    required this.featureId,
    required this.featureEnabled,
    required this.isActivated,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (isActivated) {
      return SizedBox(
        width: 100,
        child: Switch(
          value: featureEnabled,
          onChanged: (bool value) async {
            DocumentReference reference = FirebaseFirestore.instance
                .collection('featureFlipping')
                .doc(featureId);
            await reference.update(
              {
                type == FeatureFlippingType.uat ? 'uatEnabled' : 'prodEnabled':
                    value,
              },
            );
          },
        ),
      );
    } else {
      return const Icon(Icons.lock);
    }
  }
}
