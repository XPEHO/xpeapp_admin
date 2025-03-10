import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:xpeapp_admin/data/entities/agenda/events_entity.dart';
import 'package:xpeapp_admin/data/entities/agenda/events_put_entity.dart';
import 'package:xpeapp_admin/presentation/pages/agenda/events/events_card.dart';
import 'package:xpeapp_admin/presentation/pages/template/subtitle.dart';
import 'package:xpeapp_admin/presentation/widgets/agenda/common_floating_action_buttons.dart';
import 'package:xpeapp_admin/providers.dart';
import 'package:xpeapp_admin/presentation/pages/agenda/events/event_add_or_edit_page.dart';

enum AgendaContentEventsMode {
  view,
  create,
  edit,
}

class AgendaContentEvents extends ConsumerStatefulWidget {
  const AgendaContentEvents({super.key});

  @override
  ConsumerState<AgendaContentEvents> createState() =>
      AgendaContentEventsState();
}

class AgendaContentEventsState extends ConsumerState<AgendaContentEvents> {
  AgendaContentEventsMode mode = AgendaContentEventsMode.view;
  EventsPutEntity? eventToEdit;
  EventsEntity? eventToView;

  @override
  Widget build(BuildContext context) {
    EventTypePage typePage = mode == AgendaContentEventsMode.create
        ? EventTypePage.add
        : EventTypePage.edit;
    return (mode == AgendaContentEventsMode.view)
        ? _viewMode()
        : EventAddOrEditPage(
            typePage: typePage,
            event: eventToEdit,
            onDismissed: () {
              setState(() {
                mode = AgendaContentEventsMode.view;
                eventToEdit = null;
              });
            },
          );
  }

  Widget _viewMode() {
    final eventsAsyncValue = ref.watch(agendaEventsProvider);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Événements de XPEHO'),
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          subtitleWidget(
            'Créez ou gérez les événements de XPEHO',
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
                          onEdit: () {
                            setState(() {
                              mode = AgendaContentEventsMode.edit;
                              eventToEdit = EventsPutEntity(
                                id: event.id,
                                title: event.title,
                                date: event.date,
                                topic: event.topic,
                                location: event.location,
                                start_time: event.start_time,
                                end_time: event.end_time,
                                type_id: event.type.id,
                              );
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
      floatingActionButton: CommonFloatingActionButtons(
        onCreate: () {
          setState(() {
            mode = AgendaContentEventsMode.create;
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
