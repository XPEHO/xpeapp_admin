import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:xpeapp_admin/data/colors.dart';
import 'package:xpeapp_admin/data/entities/qvst/theme/qvst_theme_entity.dart';
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
                          color: Colors.grey.withValues(alpha: 0.5),
                        ),
                        children: [
                          TableRow(
                            children: [
                              TableCell(
                                child: getTextOfTable('Date de début',
                                    isHeader: true),
                              ),
                              TableCell(
                                child: getTextOfTable('Thèmes', isHeader: true),
                              ),
                              TableCell(
                                child: getTextOfTable(
                                    'Nombre de participant(s)',
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
                                    child: getThemesWidget(campaign.themes),
                                  ),
                                  TableCell(
                                    verticalAlignment:
                                        TableCellVerticalAlignment.middle,
                                    child: _participantsCountWidget(
                                        ref, campaign.id),
                                  ),
                                  TableCell(
                                    verticalAlignment:
                                        TableCellVerticalAlignment.middle,
                                    child: getTextOfTable(campaign.status),
                                  ),
                                  TableCell(
                                    verticalAlignment:
                                        TableCellVerticalAlignment.middle,
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

  Widget getThemesWidget(List<QvstThemeEntity> themes) {
    if (themes.isEmpty) {
      return const Text(
        'Aucun thème',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 16,
          fontStyle: FontStyle.italic,
          color: Colors.grey,
        ),
      );
    }

    final themeNames = themes.map((theme) => theme.name).join(' • ');

    return Text(
      themeNames,
      textAlign: TextAlign.center,
      style: const TextStyle(fontSize: 16),
    );
  }

  Widget _participantsCountWidget(WidgetRef ref, String campaignId) {
    final analysis = ref.watch(qvstCampaignAnalysisProvider(campaignId));
    return analysis.when(
      data: (data) {
        final count = data.globalStats?.totalRespondents ?? 0;
        return getTextOfTable('$count ${count > 1 ? '' : ''}');
      },
      loading: () => getTextOfTable('...'),
      error: (_, __) => getTextOfTable('-'),
    );
  }
}
