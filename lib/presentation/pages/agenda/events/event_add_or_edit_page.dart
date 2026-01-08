import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:xpeapp_admin/data/entities/agenda/events_entity.dart';
import 'package:xpeapp_admin/data/entities/agenda/events_type_entity.dart';
import 'package:xpeapp_admin/data/enum/crud_page_mode.dart';
import 'package:xpeapp_admin/presentation/widgets/agenda/agenda_sliver_form.dart';
import 'package:xpeapp_admin/presentation/widgets/agenda/agenda_form_date_picker.dart';
import 'package:xpeapp_admin/presentation/widgets/agenda/agenda_form_elevated_button.dart';
import 'package:xpeapp_admin/presentation/widgets/agenda/agenda_form_field.dart';
import 'package:xpeapp_admin/presentation/widgets/agenda/agenda_form_label.dart';
import 'package:xpeapp_admin/presentation/widgets/agenda/agenda_handle_error_in_operation.dart';
import 'package:xpeapp_admin/presentation/widgets/agenda/datetime_picker_methods.dart';
import 'package:xpeapp_admin/providers.dart';
import 'package:xpeapp_admin/data/colors.dart';

class EventAddOrEditPage extends ConsumerStatefulWidget {
  final CrudPageMode pageMode;
  final EventsEntity? event;
  final VoidCallback onDismissed;

  const EventAddOrEditPage({
    super.key,
    required this.pageMode,
    this.event,
    required this.onDismissed,
  });

  @override
  ConsumerState<EventAddOrEditPage> createState() => _EventAddOrEditPageState();
}

class _EventAddOrEditPageState extends ConsumerState<EventAddOrEditPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController locationController = TextEditingController();
  final TextEditingController startTimeController = TextEditingController();
  final TextEditingController endTimeController = TextEditingController();
  DateTime? selectedDate;
  DateTime? selectedEndDate;
  TimeOfDay? selectedStartTime;
  TimeOfDay? selectedEndTime;
  bool isDateSelected = false;
  String? selectedEventType;
  bool isButtonEnabled = false;
  bool noTimeMode = false;

  @override
  void initState() {
    super.initState();
    _initializeForm();
  }

  void _initializeForm() {
    // When any of the form fields changes (edit or create) in the form.
    if (widget.event != null) {
      titleController.text = widget.event!.title;
      descriptionController.text = widget.event!.topic ?? '';
      locationController.text = widget.event!.location ?? '';
      startTimeController.text = widget.event!.startTime != null
          ? getTimeStringFromTimeOfDay(widget.event!.startTime!)
          : '';
      endTimeController.text = widget.event!.endTime != null
          ? getTimeStringFromTimeOfDay(widget.event!.endTime!)
          : '';
      selectedDate = widget.event!.date;
      selectedEndDate = widget.event!.endDate;
      selectedEventType = widget.event?.typeId;
      isDateSelected = selectedDate != null;
    }
    _updateButtonState();
  }

  void _updateButtonState() {
    setState(() {
      isButtonEnabled = titleController.text.isNotEmpty &&
          selectedDate != null &&
          selectedEventType != null;

      // If no time is set, enable noTimeMode
      noTimeMode = selectedDate != null &&
          selectedEndDate != null &&
          (startTimeController.text.isEmpty && endTimeController.text.isEmpty);
      if (noTimeMode) {
        startTimeController.text = '';
        endTimeController.text = '';
        selectedStartTime = null;
        selectedEndTime = null;
      }
    });
  }

  // This method is called when any of the form fields change
  void _onFieldChanged() {
    _updateButtonState();
  }

  @override
  void dispose() {
    titleController.dispose();
    descriptionController.dispose();
    locationController.dispose();
    startTimeController.dispose();
    endTimeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final eventTypes = ref.watch(agendaEventsTypeProvider);
    EventsTypeEntity? selectedType;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          '${(widget.pageMode == CrudPageMode.create) ? 'Ajouter' : 'Modifier'} un événement',
        ),
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body: Form(
        key: _formKey,
        child: AgendaSliverForm(
          subtitleText:
              'Remplissez les informations pour ${widget.pageMode == CrudPageMode.create ? 'ajouter' : 'modifier'} un événement \n (* = champ obligatoire)',
          formFields: [
            const AgendaFormLabel(
              text: 'Type d\'événement : ',
              color: Colors.black,
            ),
            const SizedBox(height: 10),
            eventTypes.when(
              data: (types) {
                if (selectedEventType != null && types.isNotEmpty) {
                  selectedType = types.cast<EventsTypeEntity?>().firstWhere(
                        (type) => type?.id == selectedEventType,
                        orElse: () => null,
                      );
                }
                return DropdownButton<EventsTypeEntity>(
                  value: selectedType,
                  hint: const Text('Sélectionnez un type d\'événement'),
                  onChanged: (EventsTypeEntity? newValue) {
                    setState(() {
                      selectedEventType = newValue?.id;
                    });
                    _onFieldChanged();
                  },
                  items: types.map<DropdownMenuItem<EventsTypeEntity>>(
                    (EventsTypeEntity type) {
                      return DropdownMenuItem<EventsTypeEntity>(
                        value: type,
                        child: Text(type.label),
                      );
                    },
                  ).toList(),
                );
              },
              loading: () => const CircularProgressIndicator(),
              error: (error, stack) => Text('Erreur: $error'),
            ),
            const SizedBox(height: 20),
            const AgendaFormLabel(
              text: 'Choisissez un titre : *',
              color: Colors.black,
            ),
            const SizedBox(height: 20),
            AgendaFormField(
                controller: titleController,
                hintText: 'Titre de l\'événement',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez entrer un titre';
                  }
                  return null;
                },
                onChanged: (_) => _onFieldChanged()),
            const SizedBox(height: 20),
            const AgendaFormLabel(
              text: 'Topic : ',
              color: Colors.black,
            ),
            const SizedBox(height: 20),
            AgendaFormField(
              controller: descriptionController,
              hintText: 'Topic de l\'événement',
              maxLines: 5,
            ),
            const SizedBox(height: 20),
            const AgendaFormLabel(
              text: 'Lieu : ',
              color: Colors.black,
            ),
            const SizedBox(height: 20),
            AgendaFormField(
              controller: locationController,
              hintText: 'Lieu de l\'événement',
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
                    _onFieldChanged();
                  });
                },
              ),
              labelText: 'Date de début : *',
            ),
            const SizedBox(height: 20),
            AgendaFormDatePicker(
              selectedDate: selectedEndDate,
              onDateSelected: () => showDatePickerForEvent(
                context: context,
                selectedDate: selectedEndDate,
                onDateSelected: (date) {
                  setState(() {
                    selectedEndDate = date;
                    _onFieldChanged();
                  });
                },
              ),
              labelText: 'Date de fin :',
            ),
            const SizedBox(height: 20),
            if (!noTimeMode) ...[
              const AgendaFormLabel(
                text: 'Heure de début : ',
                color: Colors.black,
              ),
              const SizedBox(height: 20),
              AgendaFormField(
                controller: startTimeController,
                hintText: 'Heure de début',
                readOnly: true,
                onTap: () => showTimePickerForEvent(
                  context: context,
                  isStartTime: true,
                  onTimeSelected: (time) {
                    setState(() {
                      selectedStartTime = time;
                      startTimeController.text =
                          time != null ? getTimeStringFromTimeOfDay(time) : '';
                    });
                  },
                ),
              ),
              const SizedBox(height: 20),
              const AgendaFormLabel(
                text: 'Choisissez une heure de fin : ',
                color: Colors.black,
              ),
              const SizedBox(height: 20),
              AgendaFormField(
                controller: endTimeController,
                hintText: 'Heure de fin',
                readOnly: true,
                onTap: () => showTimePickerForEvent(
                  context: context,
                  isStartTime: false,
                  onTimeSelected: (time) {
                    setState(() {
                      selectedEndTime = time;
                      endTimeController.text =
                          time != null ? getTimeStringFromTimeOfDay(time) : '';
                    });
                  },
                ),
              ),
              const SizedBox(height: 20),
            ],
            const SizedBox(height: 20),
            AgendaFormElevatedButton(
              isEnabled: isButtonEnabled,
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  final event = EventsEntity(
                    id: widget.event?.id,
                    title: titleController.text,
                    date: selectedDate!,
                    endDate: selectedEndDate,
                    topic: descriptionController.text,
                    location: locationController.text,
                    startTime: noTimeMode
                        ? null
                        : getTimeOfDayFromTimeString(startTimeController.text),
                    endTime: noTimeMode
                        ? null
                        : getTimeOfDayFromTimeString(endTimeController.text),
                    typeId: selectedEventType!,
                  );

                  handleErrorInOperation(
                    operation: () => widget.pageMode == CrudPageMode.create
                        ? ref.read(agendaEventAddProvider(event).future)
                        : ref.read(agendaEventUpdateProvider(event).future),
                    ref: ref,
                    context: context,
                    onSuccess: () {
                      widget.onDismissed();
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            'Événement ${(widget.pageMode == CrudPageMode.create) ? 'ajouté' : 'modifié'} avec succès',
                          ),
                        ),
                      );
                    },
                    providersToInvalidate: [
                      agendaEventsProvider,
                      agendaEventAddProvider,
                      agendaEventUpdateProvider
                    ],
                  );
                }
              },
              buttonText:
                  '${(widget.pageMode == CrudPageMode.create) ? 'Ajouter' : 'Modifier'} l\'événement',
            ),
          ],
        ),
      ),
      floatingActionButton: Tooltip(
        message: 'Revenir aux événements',
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
