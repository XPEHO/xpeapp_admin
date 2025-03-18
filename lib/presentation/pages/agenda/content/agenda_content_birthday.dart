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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          subtitleWidget(
            'Créez ou gérez les anniversaires des collaborateurs',
          ),
          const Divider(),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(10),
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 50),
                child: birthdayAsyncValue.when(
                  data: (birthday) {
                    if (birthday.isEmpty) {
                      return Center(
                          child: Text(
                        "Page $currentPage\nAucun anniversaire",
                        textAlign: TextAlign.center,
                      ));
                    }
                    return Column(
                      children: [
                        Text("Page $currentPage"),
                        ListView.builder(
                          shrinkWrap: true,
                          itemCount: birthday.length,
                          itemBuilder: (context, index) {
                            final birthDay = birthday[index];
                            return BirthdayCard(
                              birthdayEntity: birthDay,
                              onEdit: () {
                                ref.read(pageModeProvider.notifier).state =
                                    CrudPageMode.edit;
                                ref
                                    .read(
                                        editingEntityBirthdayProvider.notifier)
                                    .state = birthDay;
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
