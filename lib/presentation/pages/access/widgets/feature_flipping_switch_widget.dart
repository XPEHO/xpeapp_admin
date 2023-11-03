import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:xpeapp_admin/data/entities/feature_flipping_entity.dart';

class FeatureFlippingSwitchWidget extends ConsumerWidget {
  final FeatureFlippingEntity feature;
  final bool isActivated;

  const FeatureFlippingSwitchWidget({
    super.key,
    required this.feature,
    required this.isActivated,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (isActivated) {
      return SizedBox(
        width: 100,
        child: Switch(
          value: feature.enabled,
          onChanged: (bool value) async {
            DocumentReference reference = FirebaseFirestore.instance
                .collection('featureFlipping')
                .doc(feature.idFeature);
            await reference.update(
              {
                'enabled': value,
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
