// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:xpeapp_admin/data/entities/agenda/birthday_entity.dart';
import 'package:xpeapp_admin/presentation/pages/template/subtitle.dart';
import 'package:xpeapp_admin/providers.dart';
import 'package:xpeapp_admin/data/colors.dart';

enum BirthdayTypeOfPage {
  add,
  edit,
}

class BirthdayAddOrEditPage extends ConsumerStatefulWidget {
  final BirthdayTypeOfPage typePage;
  final BirthdayEntity? birthday;
  final VoidCallback onDismissed;

  const BirthdayAddOrEditPage({
    super.key,
    required this.typePage,
    this.birthday,
    required this.onDismissed,
  });

  @override
  ConsumerState<BirthdayAddOrEditPage> createState() =>
      _BirthdayAddOrEditPageState();
}

class _BirthdayAddOrEditPageState extends ConsumerState<BirthdayAddOrEditPage> {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController birthdateController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  bool isButtonEnabled = false;
  DateTime? selectedDate;
  bool isDateSelected = false;

  @override
  void initState() {
    super.initState();
    if (widget.typePage == BirthdayTypeOfPage.edit && widget.birthday != null) {
      firstNameController.text = widget.birthday?.first_name ?? '';
      selectedDate = DateTime.parse(widget.birthday?.birthdate ?? '');
      emailController.text = widget.birthday?.email ?? '';
    }

    firstNameController.addListener(_validateForm);
    emailController.addListener(_validateForm);
  }

  @override
  void dispose() {
    firstNameController.removeListener(_validateForm);
    emailController.removeListener(_validateForm);
    firstNameController.dispose();
    birthdateController.dispose();
    emailController.dispose();
    super.dispose();
  }

  void _validateForm() {
    setState(() {
      isButtonEnabled = firstNameController.text.isNotEmpty &&
          emailController.text.isNotEmpty &&
          selectedDate != null;
    });
  }

  Future<void> showDatePickerForEvent(BuildContext context) async {
    final DateTime? selected = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2010),
      lastDate: DateTime(2035),
      currentDate: selectedDate ?? DateTime.now(),
      helpText: 'Choisir la date de l\'événement',
    );

    if (selected != null) {
      setState(() {
        selectedDate = selected;
        isDateSelected = true;
      });
      _validateForm();
    } else {
      setState(() {
        isDateSelected = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final dateFormatted = DateFormat('dd/MM/yyyy');
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          '${(widget.typePage == BirthdayTypeOfPage.add) ? 'Ajouter' : 'Modifier'} un anniversaire',
        ),
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          subtitleWidget(
            'Remplissez les informations pour ${widget.typePage == BirthdayTypeOfPage.add ? 'ajouter' : 'modifier'} un anniversaire',
          ),
          const Divider(),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _getText(
                    'Quel est le nom du collaborateur ? ',
                    color: Colors.black,
                  ),
                  const SizedBox(height: 20),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    width: 500,
                    child: TextField(
                      controller: firstNameController,
                      decoration: InputDecoration(
                        hintText: 'Nom du collaborateur',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      _getText(
                        'Choisissez une date : ',
                        color: Colors.black,
                      ),
                      const SizedBox(width: 20),
                      (selectedDate == null)
                          ? IconButton(
                              onPressed: () => showDatePickerForEvent(context),
                              icon: Row(
                                children: [
                                  const Icon(
                                    Icons.calendar_today,
                                  ),
                                  const SizedBox(width: 10),
                                  _getText(
                                    'Aucune date',
                                    size: 16,
                                    color: Colors.black,
                                  ),
                                ],
                              ),
                            )
                          : TextButton(
                              onPressed: () => showDatePickerForEvent(context),
                              child: _getText(
                                dateFormatted.format(selectedDate!),
                                size: 16,
                                color: Colors.black,
                              ),
                            ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  _getText(
                    'Quel est l\'email du collaborateur ? ',
                    color: Colors.black,
                  ),
                  const SizedBox(height: 20),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    width: 500,
                    child: TextField(
                      controller: emailController,
                      decoration: InputDecoration(
                        hintText: 'Email du collaborateur',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    margin: const EdgeInsets.only(
                      top: 30,
                      bottom: 30,
                      left: 50,
                    ),
                    width: 200,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: kDefaultXpehoColor,
                      ),
                      onPressed: isButtonEnabled
                          ? () async {
                              final birthday = BirthdayEntity(
                                id: widget.birthday?.id ?? '',
                                first_name: firstNameController.text,
                                birthdate: selectedDate.toString(),
                                email: emailController.text,
                              );
                              if (widget.typePage == BirthdayTypeOfPage.add) {
                                await ref.read(
                                    agendaBirthdayAddProvider(birthday).future);
                              } else {
                                await ref.read(
                                    agendaBirthdayUpdateProvider(birthday)
                                        .future);
                                ref.invalidate(agendaBirthdayProvider);
                              }
                              ref.invalidate(agendaBirthdayProvider);
                              widget.onDismissed();
                            }
                          : null,
                      child: Text(
                        '${(widget.typePage == BirthdayTypeOfPage.add) ? 'Ajouter' : 'Modifier'} l\'anniversaire',
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: Tooltip(
        message: 'Revenir aux anniversaires',
        child: FloatingActionButton(
          onPressed: () => widget.onDismissed(),
          backgroundColor: kDefaultXpehoColor,
          child: const Icon(
            Icons.close,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Widget _getText(String text,
          {double? size = 16, Color? color = Colors.white}) =>
      Container(
        margin: const EdgeInsets.symmetric(horizontal: 5),
        child: Text(
          text,
          style: TextStyle(
            fontSize: size,
            fontWeight: FontWeight.bold,
            color: color,
          ),
        ),
      );
}
