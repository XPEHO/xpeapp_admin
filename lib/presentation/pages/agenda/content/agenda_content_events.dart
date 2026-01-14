import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:xpeapp_admin/data/colors.dart';
import 'package:xpeapp_admin/data/entities/agenda/events_entity.dart';
import 'package:xpeapp_admin/data/entities/agenda/events_type_entity.dart';
import 'package:xpeapp_admin/data/enum/crud_page_mode.dart';
import 'package:xpeapp_admin/env/extensions/pagination.dart';
import 'package:xpeapp_admin/presentation/pages/agenda/events/event_add_or_edit_page.dart';
import 'package:xpeapp_admin/presentation/pages/agenda/events/events_card.dart';
import 'package:xpeapp_admin/presentation/widgets/agenda/agenda_floating_buttons.dart';
import 'package:xpeapp_admin/presentation/widgets/agenda/agenda_sliver_form.dart';
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
  void initState() {
    super.initState();
    // Reset the state
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(pageModeProvider.notifier).state = CrudPageMode.view;
      ref.read(editingEntityBirthdayProvider.notifier).state = null;
    });
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
      body: eventTypesAsyncValue.when(
        data: (eventTypes) {
          return eventsAsyncValue.when(
            data: (events) {
              final formFields = <Widget>[
                if (events.isEmpty)
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        "Page $currentPage\nAucun événement",
                        textAlign: TextAlign.center,
                      ),
                    ),
                  )
                else ...[
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Text(
                      "Page $currentPage",
                      textAlign: TextAlign.center,
                    ),
                  ),
                  ...events.map((event) {
                    final eventTypeLabel =
                        _getEventTypeLabel(event.typeId, eventTypes);
                    return EventsCard(
                      eventTypeLabel: eventTypeLabel,
                      events: event,
                      onEdit: () {
                        ref.read(pageModeProvider.notifier).state =
                            CrudPageMode.edit;
                        ref.read(editingEntityEventsProvider.notifier).state =
                            EventsEntity(
                          id: event.id,
                          title: event.title,
                          date: event.date,
                          endDate: event.endDate,
                          location: event.location,
                          startTime: event.startTime,
                          endTime: event.endTime,
                          topic: event.topic,
                          typeId: event.typeId,
                        );
                      },
                    );
                  }),
                ],
                const SizedBox(height: 50),
              ];

              return AgendaSliverForm(
                subtitleText: 'Créez ou gérez les événements de XPEHO',
                formFields: formFields,
              );
            },
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (error, stack) => Center(child: Text('Erreur: $error')),
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(child: Text('Erreur: $error')),
      ),
      floatingActionButton: AgendaFloatingButtons(
        customTooltip: [
          const SizedBox(width: 10),
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
          const SizedBox(width: 10),
          ref.hasNextEventsPage(currentPage)
              ? Tooltip(
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
                )
              : const SizedBox.shrink(),
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
