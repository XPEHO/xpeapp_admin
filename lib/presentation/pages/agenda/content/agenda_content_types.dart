import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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
  @override
  Widget build(BuildContext context) {
    final pageMode = ref.watch(pageModeProvider);
    final eventTypeToEdit = ref.watch(editingEntityEventsTypeProvider);
    return (pageMode == CrudPageMode.view)
        ? _viewMode()
        : EventTypesAddOrEditPage(
            pageMode: pageMode,
            eventType: eventTypeToEdit,
            onDismissed: () {
              ref.read(pageModeProvider.notifier).state = CrudPageMode.view;
              ref.read(editingEntityEventsTypeProvider.notifier).state = null;
              ref.invalidate(agendaEventsTypeProvider);
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
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: subtitleWidget(
              'Créez ou gérez les types d\'événements',
            ),
          ),
          const SliverToBoxAdapter(
            child: Divider(),
          ),
          eventsTypeAsyncValue.when(
            data: (events) {
              if (events.isEmpty) {
                return const SliverToBoxAdapter(
                  child: Center(
                    child: Text('Aucun types d\'événements'),
                  ),
                );
              }
              return SliverPadding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                sliver: SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      final event = events[index];
                      return TypeCard(
                        eventsType: event,
                        onEdit: () {
                          ref
                              .read(editingEntityEventsTypeProvider.notifier)
                              .state = event;
                          ref.read(pageModeProvider.notifier).state =
                              CrudPageMode.edit;
                        },
                      );
                    },
                    childCount: events.length,
                  ),
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
        ],
      ),
      floatingActionButton: AgendaFloatingButtons(
        onCreate: () {
          ref.read(pageModeProvider.notifier).state = CrudPageMode.create;
        },
        onRefresh: () {
          ref.invalidate(agendaEventsTypeProvider);
        },
      ),
    );
  }
}
