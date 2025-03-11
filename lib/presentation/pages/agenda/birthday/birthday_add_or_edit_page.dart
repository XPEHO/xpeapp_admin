import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:xpeapp_admin/data/entities/agenda/birthday_entity.dart';
import 'package:xpeapp_admin/presentation/pages/template/subtitle.dart';
import 'package:xpeapp_admin/presentation/widgets/agenda/common_methods.dart';
import 'package:xpeapp_admin/presentation/widgets/agenda/common_widgets.dart';
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

  @override
  Widget build(BuildContext context) {
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
                  getText('Quel est le nom du collaborateur ? ',
                      color: Colors.black),
                  const SizedBox(height: 20),
                  formTextField(
                    controller: firstNameController,
                    hintText: 'Nom du collaborateur',
                  ),
                  const SizedBox(height: 20),
                  getDatePickerRow(
                    selectedDate: selectedDate,
                    onDateSelected: () => showDatePickerForEvent(
                      context: context,
                      selectedDate: selectedDate,
                      onDateSelected: (date) {
                        setState(() {
                          selectedDate = date;
                          isDateSelected = date != null;
                        });
                        _validateForm();
                      },
                    ),
                    context: context,
                    labelText: 'Choisissez une date : ',
                  ),
                  const SizedBox(height: 20),
                  getText('Quel est l\'email du collaborateur ? ',
                      color: Colors.black),
                  const SizedBox(height: 20),
                  formTextField(
                    controller: emailController,
                    hintText: 'Email du collaborateur',
                  ),
                  const SizedBox(height: 20),
                  getElevatedButton(
                    isEnabled: isButtonEnabled,
                    onPressed: () async {
                      final birthday = BirthdayEntity(
                        id: widget.birthday?.id ?? '',
                        first_name: firstNameController.text,
                        birthdate: selectedDate.toString(),
                        email: emailController.text,
                      );
                      if (widget.typePage == BirthdayTypeOfPage.add) {
                        await ref
                            .read(agendaBirthdayAddProvider(birthday).future);
                      } else {
                        await ref.read(
                            agendaBirthdayUpdateProvider(birthday).future);
                        ref.invalidate(agendaBirthdayProvider);
                      }
                      ref.invalidate(agendaBirthdayProvider);
                      widget.onDismissed();
                    },
                    buttonText:
                        '${(widget.typePage == BirthdayTypeOfPage.add) ? 'Ajouter' : 'Modifier'} l\'anniversaire',
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
}
