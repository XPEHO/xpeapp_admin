import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:xpeapp_admin/data/colors.dart';
import 'package:xpeapp_admin/data/entities/agenda/birthday_entity.dart';
import 'package:xpeapp_admin/presentation/pages/agenda/birthday/birthday_add_or_edit_page.dart';
import 'package:xpeapp_admin/presentation/pages/agenda/birthday/birthday_card.dart';
import 'package:xpeapp_admin/presentation/pages/template/subtitle.dart';
import 'package:xpeapp_admin/presentation/widgets/agenda/common_floating_action_buttons.dart';
import 'package:xpeapp_admin/providers.dart';

enum AgendaContentBirthdayMode {
  view,
  create,
  edit,
}

class AgendaContentBirthday extends ConsumerStatefulWidget {
  const AgendaContentBirthday({super.key});

  @override
  ConsumerState<AgendaContentBirthday> createState() =>
      AgendaContentBirthdayState();
}

class AgendaContentBirthdayState extends ConsumerState<AgendaContentBirthday> {
  AgendaContentBirthdayMode mode = AgendaContentBirthdayMode.view;
  BirthdayEntity? birthdayToEdit;
  int currentPage = 1;

  @override
  Widget build(BuildContext context) {
    BirthdayTypeOfPage typePage = mode == AgendaContentBirthdayMode.create
        ? BirthdayTypeOfPage.add
        : BirthdayTypeOfPage.edit;
    return (mode == AgendaContentBirthdayMode.view)
        ? _viewMode()
        : BirthdayAddOrEditPage(
            typePage: typePage,
            birthday: birthdayToEdit,
            onDismissed: () {
              setState(() {
                mode = AgendaContentBirthdayMode.view;
                birthdayToEdit = null;
              });
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
                      return const Center(
                          child: Text('Aucun anniversaires trouvés'));
                    }
                    return Column(
                      children: [
                        ListView.builder(
                          shrinkWrap: true,
                          itemCount: birthday.length,
                          itemBuilder: (context, index) {
                            final birthDay = birthday[index];
                            return BirthdayCard(
                              birthdayEntity: birthDay,
                              onEdit: () {
                                setState(() {
                                  birthdayToEdit = birthDay;
                                  mode = AgendaContentBirthdayMode.edit;
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
      floatingActionButton: CommonFloatingActionButtons(
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
          setState(() {
            mode = AgendaContentBirthdayMode.create;
            birthdayToEdit = null;
          });
        },
        onRefresh: () {
          ref.invalidate(agendaBirthdayProvider);
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
