import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:xpeapp_admin/data/colors.dart';
import 'package:xpeapp_admin/data/enum/qvst_menu.dart';
import 'package:xpeapp_admin/presentation/pages/qvst/widgets/qvst_create_campaign.dart';
import 'package:xpeapp_admin/presentation/pages/template/subtitle.dart';
import 'package:xpeapp_admin/providers.dart';

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
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Campagnes QVST'),
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          subtitleWidget(
            'Créez ou gérez les campagnes QVST',
          ),
          const Divider(),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(10),
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
                                child: getTextOfTable('Date de début',
                                    isHeader: true),
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
          ),
        ],
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Tooltip(
            message: "Recharger les campagnes QVST",
            child: FloatingActionButton(
              onPressed: () {
                ref.invalidate(qvstCampaignsProvider);
              },
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
            message: 'Créer une campagne QVST',
            child: FloatingActionButton(
              onPressed: () => setState(() {
                mode = QvstContentCampaignMode.create;
              }),
              backgroundColor: kDefaultXpehoColor,
              child: const Icon(
                Icons.add,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
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
