import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:xpeapp_admin/data/entities/feature_flipping_entity.dart';
import 'package:xpeapp_admin/presentation/pages/feature_flipping/widgets/feature_flipping_switch_widget.dart';
import 'package:xpeapp_admin/presentation/pages/template/subtitle.dart';
import 'package:xpeapp_admin/providers.dart';

class FeatureFlippingPage extends ConsumerWidget {
  const FeatureFlippingPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Feature Flipping'),
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          subtitleWidget(
            'Activez ou désactivez les fonctionnalités de l\'application mobile',
          ),
          const Divider(),
          Expanded(
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

                return SingleChildScrollView(
                  child: Table(
                    children: [
                      const TableRow(
                        children: [
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              'Fonctionnalité',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 50,
                            child: Text(
                              'UAT',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 50,
                            child: Text(
                              'PROD',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                      ...features
                          .where((feature) =>
                              feature.idFeature == 'campaign' ||
                              feature.idFeature == 'newsletters' ||
                              feature.idFeature == 'profile' ||
                              feature.idFeature == 'agenda' ||
                              feature.idFeature == 'ideaBox')
                          .map(
                            (e) => TableRow(
                              children: [
                                TableCell(
                                  verticalAlignment:
                                      TableCellVerticalAlignment.middle,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: ListTile(
                                      title: Text(e.name),
                                      subtitle: Text(e.description),
                                    ),
                                  ),
                                ),
                                TableCell(
                                  verticalAlignment:
                                      TableCellVerticalAlignment.middle,
                                  child: SizedBox(
                                    height: 50,
                                    child: FeatureFlippingSwitchWidget(
                                      featureId: e.idFeature,
                                      type: FeatureFlippingType.uat,
                                      featureEnabled: e.uatEnabled,
                                      isActivated: true,
                                    ),
                                  ),
                                ),
                                TableCell(
                                  verticalAlignment:
                                      TableCellVerticalAlignment.middle,
                                  child: SizedBox(
                                    height: 50,
                                    child: FeatureFlippingSwitchWidget(
                                      featureId: e.idFeature,
                                      type: FeatureFlippingType.prod,
                                      featureEnabled: e.prodEnabled,
                                      isActivated: true,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
