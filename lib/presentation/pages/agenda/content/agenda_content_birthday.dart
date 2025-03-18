import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:xpeapp_admin/data/colors.dart';
import 'package:xpeapp_admin/data/enum/crud_page_mode.dart';
import 'package:xpeapp_admin/presentation/pages/agenda/birthday/birthday_add_or_edit_page.dart';
import 'package:xpeapp_admin/presentation/pages/agenda/birthday/birthday_card.dart';
import 'package:xpeapp_admin/presentation/pages/template/subtitle.dart';
import 'package:xpeapp_admin/presentation/widgets/agenda/agenda_floating_buttons.dart';
import 'package:xpeapp_admin/providers.dart';

class AgendaContentBirthday extends ConsumerStatefulWidget {
  const AgendaContentBirthday({super.key});

  @override
  ConsumerState<AgendaContentBirthday> createState() =>
      AgendaContentBirthdayState();
}

class AgendaContentBirthdayState extends ConsumerState<AgendaContentBirthday> {
  int currentPage = 1;

  @override
  Widget build(BuildContext context) {
    final pageMode = ref.watch(pageModeProvider);
    final birthdayToEdit = ref.watch(editingEntityBirthdayProvider);

    return (pageMode == CrudPageMode.view)
        ? _viewMode()
        : BirthdayAddOrEditPage(
            pageMode: pageMode,
            birthday: birthdayToEdit,
            onDismissed: () {
              ref.read(pageModeProvider.notifier).state = CrudPageMode.view;
              ref.read(editingEntityBirthdayProvider.notifier).state = null;
              ref.invalidate(agendaBirthdayProvider);
            },
          );
  }

  Widget _viewMode() {
    final birthdayAsyncValue = ref.watch(agendaBirthdayProvider(currentPage));
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Anniversaires des collaborateurs de XPEHO'),
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: subtitleWidget(
              'Créez ou gérez les anniversaires des collaborateurs',
            ),
          ),
          const SliverToBoxAdapter(
            child: Divider(),
          ),
          birthdayAsyncValue.when(
            data: (birthday) {
              if (birthday.isEmpty) {
                return SliverToBoxAdapter(
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        "Page $currentPage\nAucun anniversaire",
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
                    final birthDay = birthday[index - 1];
                    return BirthdayCard(
                      birthdayEntity: birthDay,
                      onEdit: () {
                        ref.read(pageModeProvider.notifier).state =
                            CrudPageMode.edit;
                        ref.read(editingEntityBirthdayProvider.notifier).state =
                            birthDay;
                      },
                    );
                  },
                  childCount: birthday.length + 1, // +1 for the page text
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
                        ref.invalidate(agendaBirthdayProvider);
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
                  ref.invalidate(agendaBirthdayProvider);
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
          ref.invalidate(agendaBirthdayProvider);
        },
      ),
    );
  }
}
