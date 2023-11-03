import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:xpeapp_admin/data/entities/feature_flipping_entity.dart';
import 'package:xpeapp_admin/data/entities/user_access_entity.dart';
import 'package:xpeapp_admin/presentation/pages/access/widgets/feature_flipping_switch_widget.dart';
import 'package:xpeapp_admin/presentation/widgets/user_access_widget.dart';
import 'package:xpeapp_admin/providers.dart';

class AccessDetailPage extends ConsumerWidget {
  final String id;
  final String nameOfAccessUser;

  const AccessDetailPage({
    super.key,
    required this.id,
    required this.nameOfAccessUser,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Accès de $nameOfAccessUser'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ...titleAndDivider(
            title: 'Général',
            subtitle: 'Activez ou désactivez les accès administrateurs',
          ),
          Expanded(
            child: StreamBuilder(
              stream: ref
                  .watch(cloudFirestoreProvider)
                  .collection('access')
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                List<UserAccessEntity> accessList = [];
                snapshot.data?.docs.forEach(
                  (element) {
                    accessList.add(
                      UserAccessEntity.fromJson(
                        element.data()..['idAccess'] = element.id,
                      ),
                    );
                  },
                );
                return StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
                  stream: FirebaseFirestore.instance
                      .collection('users')
                      .doc(id)
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }

                    // Get the access map of the user
                    Map<String, dynamic> accessMap = (snapshot.data?.data()
                        as Map<String, dynamic>)['access'];
                    return UserAccessWidget(
                      accessList: accessList,
                      uidUser: id,
                      accessMap: accessMap,
                    );
                  },
                );
              },
            ),
          ),
          ...titleAndDivider(
            title: 'Feature Flipping',
            subtitle:
                'Activez ou désactivez les fonctionnalités de l\'application mobile',
          ),
          Flexible(
            child: StreamBuilder(
              stream: ref
                  .watch(cloudFirestoreProvider)
                  .collection('featureFlipping')
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                List<FeatureFlippingEntity> features = [];
                snapshot.data?.docs.forEach(
                  (element) {
                    features.add(
                      FeatureFlippingEntity.fromJson(
                        element.data()..['idFeature'] = element.id,
                      ),
                    );
                  },
                );

                return ListView.builder(
                  itemCount: features.length,
                  itemBuilder: (context, index) {
                    FeatureFlippingEntity feature = features[index];
                    return ListTile(
                      title: Text(feature.name),
                      subtitle: Text(feature.description),
                      trailing: StreamBuilder(
                        stream: ref
                            .watch(cloudFirestoreProvider)
                            .collection('users')
                            .doc(id)
                            .snapshots(),
                        builder: (context, snapshot) {
                          return FeatureFlippingSwitchWidget(
                            feature: feature,
                            isActivated: (snapshot.data?.data())?['access']
                                    ['featureFlipping'] as bool? ??
                                false,
                          );
                        },
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> titleAndDivider({
    required String title,
    String? subtitle,
  }) {
    return [
      Padding(
        padding: const EdgeInsets.only(
          left: 16,
          top: 16,
          bottom: 8,
        ),
        child: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
      ),
      if (subtitle != null)
        Padding(
          padding: const EdgeInsets.only(
            left: 16,
            bottom: 16,
          ),
          child: Text(
            subtitle,
            style: const TextStyle(
              fontSize: 14,
              fontStyle: FontStyle.italic,
            ),
          ),
        ),
      const Divider(),
    ];
  }
}
