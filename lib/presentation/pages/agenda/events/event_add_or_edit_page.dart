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
  TimeOfDay? selectedStartTime;
  TimeOfDay? selectedEndTime;
  bool isDateSelected = false;
  String? selectedEventType;

  @override
  void initState() {
    super.initState();
    if (widget.pageMode == CrudPageMode.edit && widget.event != null) {
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
      selectedEventType = widget.event?.typeId;
      isDateSelected = true;
    }
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
                final selectedType = types.isNotEmpty
                    ? types.firstWhere(
                        (type) => type.id == selectedEventType,
                        orElse: () => types.first,
                      )
                    : null;
                return DropdownButton<EventsTypeEntity>(
                  value: selectedType,
                  hint: const Text('Sélectionnez un type d\'événement'),
                  onChanged: (EventsTypeEntity? newValue) {
                    setState(() {
                      selectedEventType = newValue?.id;
                    });
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
            ),
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
                  });
                },
              ),
              labelText: 'Date : *',
            ),
            const SizedBox(height: 20),
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
            AgendaFormElevatedButton(
              isEnabled: _formKey.currentState?.validate() ?? false,
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  final event = EventsEntity(
                    id: widget.event?.id,
                    title: titleController.text,
                    date: selectedDate!,
                    topic: descriptionController.text,
                    location: locationController.text,
                    startTime:
                        getTimeOfDayFromTimeString(startTimeController.text),
                    endTime: getTimeOfDayFromTimeString(endTimeController.text),
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
