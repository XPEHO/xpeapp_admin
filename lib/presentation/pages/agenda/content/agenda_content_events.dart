import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:xpeapp_admin/data/colors.dart';
import 'package:xpeapp_admin/data/entities/agenda/events_entity.dart';
import 'package:xpeapp_admin/data/enum/crud_page_mode.dart';
import 'package:xpeapp_admin/presentation/pages/agenda/events/events_card.dart';
import 'package:xpeapp_admin/presentation/pages/template/subtitle.dart';
import 'package:xpeapp_admin/presentation/widgets/agenda/agenda_floating_buttons.dart';
import 'package:xpeapp_admin/providers.dart';
import 'package:xpeapp_admin/presentation/pages/agenda/events/event_add_or_edit_page.dart';

class AgendaContentEvents extends ConsumerStatefulWidget {
  const AgendaContentEvents({super.key});

  @override
  ConsumerState<AgendaContentEvents> createState() =>
      AgendaContentEventsState();
}

class AgendaContentEventsState extends ConsumerState<AgendaContentEvents> {
  CrudPageMode pageMode = CrudPageMode.view;
  EventsEntity? eventToEdit;
  EventsEntity? eventToView;
  int currentPage = 1;

  @override
  Widget build(BuildContext context) {
    return (pageMode == CrudPageMode.view)
        ? _viewMode()
        : EventAddOrEditPage(
            pageMode: pageMode,
            event: eventToEdit,
            onDismissed: () {
              setState(() {
                pageMode = CrudPageMode.view;
                eventToEdit = null;
              });
            },
          );
  }

  Widget _viewMode() {
    final eventsAsyncValue = ref.watch(agendaEventsProvider(currentPage));
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
                    return Column(
                      children: [
                        ListView.builder(
                          shrinkWrap: true,
                          itemCount: events.length,
                          itemBuilder: (context, index) {
                            final event = events[index];
                            return EventsCard(
                              events: event,
                              onEdit: () {
                                setState(() {
                                  pageMode = CrudPageMode.edit;
                                  eventToEdit = EventsEntity(
                                    id: event.id,
                                    title: event.title,
                                    date: event.date,
                                    topic: event.topic,
                                    location: event.location,
                                    startTime: event.startTime,
                                    endTime: event.endTime,
                                    typeId: event.typeId,
                                  );
                                });
                              },
                            );
                          },
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                      ],
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
        customTooltip: [
          const SizedBox(
            width: 10,
          ),
          Tooltip(
            message: "Précédent",
            child: FloatingActionButton(
              onPressed: currentPage > 1
                  ? () {
                      setState(() {
                        currentPage--;
                      });
                    }
                  : null,
              backgroundColor: kDefaultXpehoColor,
              child: const Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Tooltip(
            message: "Suivant",
            child: FloatingActionButton(
              onPressed: () {
                setState(() {
                  currentPage++;
                });
              },
              backgroundColor: kDefaultXpehoColor,
              child: const Icon(
                Icons.arrow_forward,
                color: Colors.white,
              ),
            ),
          ),
        ],
        onCreate: () {
          setState(() {
            pageMode = CrudPageMode.create;
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
