import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:xpeapp_admin/data/colors.dart';
import 'package:xpeapp_admin/data/enum/qvst_menu.dart';
import 'package:xpeapp_admin/presentation/pages/qvst/widgets/qvst_create_campaign.dart';
import 'package:xpeapp_admin/providers.dart';
import 'package:yaki_ui/button.dart';

enum QvstContentCampaignMode {
  view,
  create,
}

class QvstContentCampaign extends ConsumerStatefulWidget {
  const QvstContentCampaign({super.key});

  @override
  ConsumerState<QvstContentCampaign> createState() =>
      _QvstContentCampaignState();
}

class _QvstContentCampaignState extends ConsumerState<QvstContentCampaign> {
  QvstContentCampaignMode mode = QvstContentCampaignMode.view;

  @override
  Widget build(BuildContext context) {
    return (mode == QvstContentCampaignMode.view)
        ? _viewMode()
        : QvstCreateCampaign(
            onDismissed: () {
              setState(() {
                mode = QvstContentCampaignMode.view;
              });
            },
          );
  }

  Widget _viewMode() {
    final qvstCampaigns = ref.watch(qvstCampaignsProvider);
    return Column(
      children: [
        const SizedBox(height: 20),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 250,
                child: Button(
                  text: 'Lancer une campagne',
                  onPressed: () => setState(() {
                    mode = QvstContentCampaignMode.create;
                  }),
                  color: kDefaultXpehoColor,
                ),
              ),
              const SizedBox(width: 50),
              const Text(
                'Les campagnes',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Spacer(),
            ],
          ),
        ),
        const SizedBox(height: 100),
        Expanded(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 50),
            child: qvstCampaigns.when(
              data: (campaigns) {
                if (campaigns.isEmpty) {
                  return const Center(
                    child: Text('Aucune campagne'),
                  );
                } else {
                  return Table(
                    border: TableBorder.all(
                      color: Colors.grey.withOpacity(0.5),
                    ),
                    children: [
                      TableRow(
                        children: [
                          TableCell(
                            child:
                                getTextOfTable('Date de début', isHeader: true),
                          ),
                          TableCell(
                            child: getTextOfTable('Thème', isHeader: true),
                          ),
                          TableCell(
                            child: getTextOfTable('Taux de participation',
                                isHeader: true),
                          ),
                          TableCell(
                            child: getTextOfTable('Statut', isHeader: true),
                          ),
                          TableCell(
                            child: getTextOfTable('Stats', isHeader: true),
                          ),
                        ],
                      ),
                      ...campaigns.map(
                        (campaign) {
                          return TableRow(
                            children: [
                              TableCell(
                                verticalAlignment:
                                    TableCellVerticalAlignment.middle,
                                child: getTextOfTable(
                                  DateFormat('dd/MM/yyyy').format(
                                    DateTime.parse(
                                      campaign.startDate,
                                    ),
                                  ),
                                ),
                              ),
                              TableCell(
                                verticalAlignment:
                                    TableCellVerticalAlignment.middle,
                                child: getTextOfTable(campaign.theme.name),
                              ),
                              TableCell(
                                verticalAlignment:
                                    TableCellVerticalAlignment.middle,
                                child: getTextOfTable(
                                    '${campaign.participationRate} %'),
                              ),
                              TableCell(
                                verticalAlignment:
                                    TableCellVerticalAlignment.middle,
                                child: getTextOfTable(campaign.status),
                              ),
                              TableCell(
                                child: IconButton(
                                  onPressed: () => ref
                                      .watch(
                                        qvstMenuProvider.notifier,
                                      )
                                      .changeMenu(
                                        QvstMenu.stats,
                                        id: campaign.id,
                                      ),
                                  icon: const Icon(Icons.bar_chart),
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ],
                  );
                }
              },
              error: (error, stack) => Text('Error: $error'),
              loading: () => const Center(
                child: CircularProgressIndicator(),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget getTextOfTable(String text, {bool isHeader = false}) => Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 16,
          fontWeight: isHeader ? FontWeight.bold : FontWeight.normal,
        ),
      );
}
