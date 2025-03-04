import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:xpeapp_admin/data/colors.dart';
import 'package:xpeapp_admin/data/entities/agenda/events_type_entity.dart';
import 'package:xpeapp_admin/presentation/pages/agenda/types/types_add_or_edit_page.dart';
import 'package:xpeapp_admin/presentation/pages/agenda/types/types_card.dart';
import 'package:xpeapp_admin/presentation/pages/template/subtitle.dart';
import 'package:xpeapp_admin/providers.dart';

enum AgendaContentTypesMode {
  view,
  create,
  edit,
}

class AgendaContentTypes extends ConsumerStatefulWidget {
  const AgendaContentTypes({super.key});

  @override
  ConsumerState<AgendaContentTypes> createState() => AgendaContentTypesState();
}

class AgendaContentTypesState extends ConsumerState<AgendaContentTypes> {
  AgendaContentTypesMode mode = AgendaContentTypesMode.view;
  EventsTypeEntity? eventTypeToEdit;

  @override
  Widget build(BuildContext context) {
    return (mode == AgendaContentTypesMode.view)
        ? _viewMode()
        : EventTypesAddOrEditPage(
            typePage: mode == AgendaContentTypesMode.create
                ? EventTypesTypeOfPage.add
                : EventTypesTypeOfPage.edit,
            eventType: eventTypeToEdit,
            onDismissed: () {
              setState(() {
                mode = AgendaContentTypesMode.view;
                eventTypeToEdit = null;
              });
            },
          );
  }

  Widget _viewMode() {
    final eventsTypeAsyncValue = ref.watch(agendaEventsTypeProvider);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Types d\'événements'),
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          subtitleWidget(
            'Créez ou gérez les types d\'événements',
          ),
          const Divider(),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(10),
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 50),
                child: eventsTypeAsyncValue.when(
                  data: (events) {
                    if (events.isEmpty) {
                      return const Center(
                          child: Text('Aucun types d\'événements'));
                    }
                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount: events.length,
                      itemBuilder: (context, index) {
                        final event = events[index];
                        return TypeCard(
                          eventsType: event,
                          onEdit: () {
                            setState(() {
                              eventTypeToEdit = event;
                              mode = AgendaContentTypesMode.edit;
                            });
                          },
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
            message: "Recharger les types",
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
            message: 'Créer un type d\'événement',
            child: FloatingActionButton(
              onPressed: () {
                setState(() {
                  mode = AgendaContentTypesMode.create;
                  eventTypeToEdit = null;
                });
              },
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
