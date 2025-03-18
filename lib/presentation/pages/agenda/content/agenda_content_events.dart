import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:xpeapp_admin/data/colors.dart';
import 'package:xpeapp_admin/data/entities/agenda/events_entity.dart';
import 'package:xpeapp_admin/data/entities/agenda/events_type_entity.dart';
import 'package:xpeapp_admin/data/enum/crud_page_mode.dart';
import 'package:xpeapp_admin/presentation/pages/agenda/events/event_add_or_edit_page.dart';
import 'package:xpeapp_admin/presentation/pages/agenda/events/events_card.dart';
import 'package:xpeapp_admin/presentation/pages/template/subtitle.dart';
import 'package:xpeapp_admin/presentation/widgets/agenda/agenda_floating_buttons.dart';
import 'package:xpeapp_admin/providers.dart';

class AgendaContentEvents extends ConsumerStatefulWidget {
  const AgendaContentEvents({super.key});

  @override
  ConsumerState<AgendaContentEvents> createState() =>
      AgendaContentEventsState();
}

class AgendaContentEventsState extends ConsumerState<AgendaContentEvents> {
  EventsEntity? eventToView;
  int currentPage = 1;

  // Méthode pour obtenir le label du type d'événement
  String _getEventTypeLabel(String typeId, List<EventsTypeEntity> eventTypes) {
    final eventType = eventTypes.firstWhere(
      (type) => type.id == typeId,
      orElse: () =>
          const EventsTypeEntity(id: '', label: 'Inconnu', colorCode: ''),
    );
    return eventType.label;
  }

  @override
  Widget build(BuildContext context) {
    final pageMode = ref.watch(pageModeProvider);
    final eventToEdit = ref.watch(editingEntityEventsProvider);
    return (pageMode == CrudPageMode.view)
        ? _viewMode()
        : EventAddOrEditPage(
            pageMode: pageMode,
            event: eventToEdit,
            onDismissed: () {
              ref.read(pageModeProvider.notifier).state = CrudPageMode.view;
              ref.read(editingEntityEventsProvider.notifier).state = null;
            },
          );
  }

  Widget _viewMode() {
    final eventsAsyncValue = ref.watch(agendaEventsProvider(currentPage));
    final eventTypesAsyncValue = ref.watch(agendaEventsTypeProvider);

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Événements de XPEHO'),
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: subtitleWidget(
              'Créez ou gérez les événements de XPEHO',
            ),
          ),
          const SliverToBoxAdapter(
            child: Divider(),
          ),
          eventTypesAsyncValue.when(
            data: (eventTypes) {
              return eventsAsyncValue.when(
                data: (events) {
                  if (events.isEmpty) {
                    return SliverToBoxAdapter(
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text(
                            "Page $currentPage\nAucun événement",
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    );
                  }
                  return SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        if (index == 0) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Text(
                              "Page $currentPage",
                              textAlign: TextAlign.center,
                            ),
                          );
                        }
                        final event = events[index - 1];
                        final eventTypeLabel =
                            _getEventTypeLabel(event.typeId, eventTypes);
                        return EventsCard(
                          eventTypeLabel: eventTypeLabel,
                          events: event,
                          onEdit: () {
                            ref.read(pageModeProvider.notifier).state =
                                CrudPageMode.edit;
                            ref
                                .read(editingEntityEventsProvider.notifier)
                                .state = EventsEntity(
                              id: event.id,
                              title: event.title,
                              date: event.date,
                              location: event.location,
                              startTime: event.startTime,
                              endTime: event.endTime,
                              topic: event.topic,
                              typeId: event.typeId,
                            );
                          },
                        );
                      },
                      childCount: events.length + 1, // +1 for the page text
                    ),
                  );
                },
                loading: () => const SliverToBoxAdapter(
                  child: Center(child: CircularProgressIndicator()),
                ),
                error: (error, stack) => SliverToBoxAdapter(
                  child: Center(child: Text('Erreur: $error')),
                ),
              );
            },
            loading: () => const SliverToBoxAdapter(
              child: Center(child: CircularProgressIndicator()),
            ),
            error: (error, stack) => SliverToBoxAdapter(
              child: Center(child: Text('Erreur: $error')),
            ),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(height: 50),
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
          ref.read(pageModeProvider.notifier).state = CrudPageMode.create;
        },
        onRefresh: () {
          ref.invalidate(agendaEventsProvider);
          ref.invalidate(agendaEventsTypeProvider);
        },
      ),
    );
  }
}
