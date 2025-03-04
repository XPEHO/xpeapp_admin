import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:xpeapp_admin/data/colors.dart';
import 'package:xpeapp_admin/data/entities/agenda/birthday_entity.dart';
import 'package:xpeapp_admin/presentation/pages/agenda/birthday/birthday_add_or_edit_page.dart';
import 'package:xpeapp_admin/presentation/pages/agenda/birthday/birthday_card.dart';
import 'package:xpeapp_admin/presentation/pages/template/subtitle.dart';
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

  @override
  Widget build(BuildContext context) {
    return (mode == AgendaContentBirthdayMode.view)
        ? _viewMode()
        : BirthdayAddOrEditPage(
            typePage: mode == AgendaContentBirthdayMode.create
                ? BirthdayTypeOfPage.add
                : BirthdayTypeOfPage.edit,
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
    final eventsTypeAsyncValue = ref.watch(agendaBirthdayProvider);
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
                child: eventsTypeAsyncValue.when(
                  data: (birthday) {
                    if (birthday.isEmpty) {
                      return const Center(
                          child: Text('Aucun anniversaires trouvés'));
                    }
                    return ListView.builder(
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
            message: "Recharger les anniversaires",
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
            message: 'Créer un anniversaire',
            child: FloatingActionButton(
              onPressed: () {
                setState(() {
                  mode = AgendaContentBirthdayMode.create;
                  birthdayToEdit = null;
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
