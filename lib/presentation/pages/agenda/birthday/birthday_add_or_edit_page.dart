// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:xpeapp_admin/data/entities/agenda/birthday_entity.dart';
import 'package:xpeapp_admin/data/enum/crud_page_mode.dart';
import 'package:xpeapp_admin/presentation/pages/template/subtitle.dart';
import 'package:xpeapp_admin/presentation/widgets/agenda/agenda_form_date_picker.dart';
import 'package:xpeapp_admin/presentation/widgets/agenda/agenda_form_elevated_button.dart';
import 'package:xpeapp_admin/presentation/widgets/agenda/agenda_form_field.dart';
import 'package:xpeapp_admin/presentation/widgets/agenda/agenda_form_label.dart';
import 'package:xpeapp_admin/presentation/widgets/agenda/agenda_handle_error_in_operation.dart';
import 'package:xpeapp_admin/presentation/widgets/agenda/datetime_picker_methods.dart';
import 'package:xpeapp_admin/providers.dart';
import 'package:xpeapp_admin/data/colors.dart';

class BirthdayAddOrEditPage extends ConsumerStatefulWidget {
  final CrudPageMode pageMode;
  final BirthdayEntity? birthday;
  final VoidCallback onDismissed;

  const BirthdayAddOrEditPage({
    super.key,
    required this.pageMode,
    this.birthday,
    required this.onDismissed,
  });

  @override
  ConsumerState<BirthdayAddOrEditPage> createState() =>
      _BirthdayAddOrEditPageState();
}

class _BirthdayAddOrEditPageState extends ConsumerState<BirthdayAddOrEditPage> {
  final _formKey =
      GlobalKey<FormState>(); // Ajout du GlobalKey pour le formulaire
  TextEditingController firstNameController = TextEditingController();
  TextEditingController birthdateController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  bool isButtonEnabled = false;
  DateTime? selectedDate;
  bool isDateSelected = false;

  @override
  void initState() {
    super.initState();
    if (widget.pageMode == CrudPageMode.edit && widget.birthday != null) {
      firstNameController.text = widget.birthday?.firstName ?? '';
      selectedDate = widget.birthday?.birthdate;
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
          '${(widget.pageMode == CrudPageMode.create) ? 'Ajouter' : 'Modifier'} un anniversaire',
        ),
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body: Form(
        key: _formKey, // Ajout du formulaire
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: subtitleWidget(
                'Remplissez les informations pour ${widget.pageMode == CrudPageMode.create ? 'ajouter' : 'modifier'} un anniversaire',
              ),
            ),
            const SliverToBoxAdapter(
              child: Divider(),
            ),
            SliverPadding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              sliver: SliverList(
                delegate: SliverChildListDelegate(
                  [
                    const AgendaFormLabel(
                      text: 'Quel est le nom du collaborateur ? ',
                      color: Colors.black,
                    ),
                    const SizedBox(height: 20),
                    AgendaFormField(
                      controller: firstNameController,
                      hintText: 'Nom du collaborateur',
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Veuillez entrer un nom';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    AgendaFormDatePicker(
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
                      labelText: 'Date de naissance : ',
                    ),
                    const SizedBox(height: 20),
                    const AgendaFormLabel(
                      text: 'Quel est l\'email du collaborateur ? ',
                      color: Colors.black,
                    ),
                    const SizedBox(height: 20),
                    AgendaFormField(
                      controller: emailController,
                      hintText: 'Email du collaborateur',
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Veuillez entrer un email';
                        }
                        if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                          return 'Veuillez entrer un email valide';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    AgendaFormElevatedButton(
                      isEnabled: isButtonEnabled,
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          final birthday = BirthdayEntity(
                            id: widget.birthday?.id ?? '',
                            firstName: firstNameController.text,
                            birthdate: selectedDate!,
                            email: emailController.text,
                          );

                          // Handle operation if create or update
                          handleErrorInOperation(
                            operation: () => widget.pageMode ==
                                    CrudPageMode.create
                                ? ref.read(
                                    agendaBirthdayAddProvider(birthday).future)
                                : ref.read(
                                    agendaBirthdayUpdateProvider(birthday)
                                        .future),
                            ref: ref,
                            context: context,
                            onSuccess: () {
                              widget.onDismissed();
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                      'Anniversaire ${(widget.pageMode == CrudPageMode.create) ? 'ajouté' : 'modifié'} avec succès'),
                                ),
                              );
                            },
                            providersToInvalidate: [
                              agendaBirthdayProvider,
                              agendaBirthdayAddProvider,
                              agendaBirthdayUpdateProvider
                            ],
                          );
                        }
                      },
                      buttonText:
                          '${(widget.pageMode == CrudPageMode.create) ? 'Ajouter' : 'Modifier'} l\'anniversaire',
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
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
