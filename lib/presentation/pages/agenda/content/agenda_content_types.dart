import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:xpeapp_admin/data/entities/agenda/events_type_entity.dart';
import 'package:xpeapp_admin/data/enum/crud_page_mode.dart';
import 'package:xpeapp_admin/presentation/pages/agenda/types/types_add_or_edit_page.dart';
import 'package:xpeapp_admin/presentation/pages/agenda/types/types_card.dart';
import 'package:xpeapp_admin/presentation/pages/template/subtitle.dart';
import 'package:xpeapp_admin/presentation/widgets/agenda/agenda_floating_buttons.dart';
import 'package:xpeapp_admin/providers.dart';

class AgendaContentTypes extends ConsumerStatefulWidget {
  const AgendaContentTypes({super.key});

  @override
  ConsumerState<AgendaContentTypes> createState() => AgendaContentTypesState();
}

class AgendaContentTypesState extends ConsumerState<AgendaContentTypes> {
  CrudPageMode pageMode = CrudPageMode.view;
  EventsTypeEntity? eventTypeToEdit;

  @override
  Widget build(BuildContext context) {
    return (pageMode == CrudPageMode.view)
        ? _viewMode()
        : EventTypesAddOrEditPage(
            pageMode: pageMode,
            eventType: eventTypeToEdit,
            onDismissed: () {
              setState(() {
                pageMode = CrudPageMode.view;
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
                              pageMode = CrudPageMode.edit;
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
      floatingActionButton: AgendaFloatingButtons(
        onCreate: () {
          setState(() {
            pageMode = CrudPageMode.create;
            eventTypeToEdit = null;
          });
        },
        onRefresh: () {
          ref.invalidate(agendaEventsProvider);
        },
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
