import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:xpeapp_admin/data/colors.dart';
import 'package:xpeapp_admin/presentation/pages/agenda/events_card.dart';
import 'package:xpeapp_admin/presentation/pages/template/subtitle.dart';
import 'package:xpeapp_admin/providers.dart';

enum AgendaContentEventsMode {
  view,
  create,
}

class AgendaContentEvents extends ConsumerStatefulWidget {
  const AgendaContentEvents({super.key});

  @override
  ConsumerState<AgendaContentEvents> createState() =>
      _QvstContentCampaignState();
}

class _QvstContentCampaignState extends ConsumerState<AgendaContentEvents> {
  AgendaContentEventsMode mode = AgendaContentEventsMode.view;

  @override
  Widget build(BuildContext context) {
    return _viewMode();

    // (mode == AgendaContentEventsMode.view)
    // ? _viewMode()
    // : AgendaCreateEvent(
    //     onDismissed: () {
    //       setState(() {
    //         mode = AgendaContentEventsMode.view;
    //       });
    //     },
    //   );
  }

  Widget _viewMode() {
    final eventsAsyncValue = ref.watch(agendaEventsProvider);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Événements d\'Xpeho'),
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          subtitleWidget(
            'Créez ou gérez les événements Xpeho',
          ),
          const Divider(),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(10),
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 50),
                child: eventsAsyncValue.when(
                  data: (events) {
                    if (events.isEmpty) {
                      return const Center(child: Text('Aucun événement'));
                    }
                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount: events.length,
                      itemBuilder: (context, index) {
                        final event = events[index];
                        return EventsCard(
                          events: event,
                        );
                      },
                    );
                  },
                  loading: () =>
                      const Center(child: CircularProgressIndicator()),
                  error: (error, stack) =>
                      Center(child: Text('Erreur: $error')),
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
            message: "Recharger les événements",
            child: FloatingActionButton(
              onPressed: () {
                ref.invalidate(agendaEventsProvider);
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
            message: 'Créer un événement',
            child: FloatingActionButton(
              onPressed: () => setState(() {
                mode = AgendaContentEventsMode.create;
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
