import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:xpeapp_admin/data/entities/agenda/events_put_entity.dart';
import 'package:xpeapp_admin/data/entities/agenda/events_type_entity.dart';
import 'package:xpeapp_admin/presentation/pages/template/subtitle.dart';
import 'package:xpeapp_admin/presentation/widgets/agenda/common_methods.dart';
import 'package:xpeapp_admin/presentation/widgets/agenda/common_widgets.dart';
import 'package:xpeapp_admin/providers.dart';
import 'package:xpeapp_admin/data/colors.dart';

enum EventTypePage {
  add,
  edit,
}

class EventAddOrEditPage extends ConsumerStatefulWidget {
  final EventTypePage typePage;
  final EventsPutEntity? event;
  final VoidCallback onDismissed;

  const EventAddOrEditPage({
    super.key,
    required this.typePage,
    this.event,
    required this.onDismissed,
  });

  @override
  ConsumerState<EventAddOrEditPage> createState() => _EventAddOrEditPageState();
}

class _EventAddOrEditPageState extends ConsumerState<EventAddOrEditPage> {
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
    if (widget.typePage == EventTypePage.edit && widget.event != null) {
      titleController.text = widget.event!.title;
      descriptionController.text = widget.event!.topic ?? '';
      locationController.text = widget.event!.location ?? '';
      startTimeController.text = widget.event!.start_time ?? '';
      endTimeController.text = widget.event!.end_time ?? '';
      selectedDate = DateTime.parse(widget.event!.date);
      selectedEventType = widget.event?.type_id;
      isDateSelected = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    final eventTypes = ref.watch(agendaEventsTypeProvider);

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          '${(widget.typePage == EventTypePage.add) ? 'Ajouter' : 'Modifier'} un événement',
        ),
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          subtitleWidget(
            'Remplissez les informations pour ${widget.typePage == EventTypePage.add ? 'ajouter' : 'modifier'} un événement',
          ),
          const Divider(),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  getText('Choisissez un titre : ', color: Colors.black),
                  const SizedBox(height: 20),
                  formTextField(
                    controller: titleController,
                    hintText: 'Titre de l\'événement',
                  ),
                  const SizedBox(height: 20),
                  getText('Choisissez une description : ', color: Colors.black),
                  const SizedBox(height: 20),
                  formTextField(
                    controller: descriptionController,
                    hintText: 'Description de l\'événement',
                    maxLines: 5,
                  ),
                  const SizedBox(height: 20),
                  getText('Choisissez un lieu : ', color: Colors.black),
                  const SizedBox(height: 20),
                  formTextField(
                    controller: locationController,
                    hintText: 'Lieu de l\'événement',
                  ),
                  const SizedBox(height: 20),
                  getText('Choisissez un type d\'événement : ',
                      color: Colors.black),
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
                      },
                    ),
                    context: context,
                    labelText: 'Choisissez une date : ',
                  ),
                  const SizedBox(height: 20),
                  getText('Choisissez une heure de début : ',
                      color: Colors.black),
                  const SizedBox(height: 20),
                  formTextField(
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
                              time?.format(context) ?? '';
                        });
                      },
                    ),
                  ),
                  const SizedBox(height: 20),
                  getText('Choisissez une heure de fin : ',
                      color: Colors.black),
                  const SizedBox(height: 20),
                  formTextField(
                    controller: endTimeController,
                    hintText: 'Heure de fin',
                    readOnly: true,
                    onTap: () => showTimePickerForEvent(
                      context: context,
                      isStartTime: false,
                      onTimeSelected: (time) {
                        setState(() {
                          selectedEndTime = time;
                          endTimeController.text = time?.format(context) ?? '';
                        });
                      },
                    ),
                  ),
                  getElevatedButton(
                    isEnabled: isDateSelected &&
                        titleController.text.isNotEmpty &&
                        selectedEventType != null,
                    onPressed: () async {
                      final event = EventsPutEntity(
                        id: widget.event?.id,
                        title: titleController.text,
                        date: selectedDate!.toIso8601String(),
                        topic: descriptionController.text,
                        location: locationController.text,
                        start_time: startTimeController.text,
                        end_time: endTimeController.text,
                        type_id: selectedEventType!,
                      );

                      if (widget.typePage == EventTypePage.add) {
                        await ref.read(agendaEventAddProvider(event).future);
                      } else {
                        await ref.read(agendaEventUpdateProvider(event).future);
                      }
                      ref.invalidate(agendaEventsProvider);
                      widget.onDismissed();
                    },
                    buttonText:
                        '${(widget.typePage == EventTypePage.add) ? 'Ajouter' : 'Modifier'} l\'événement',
                  ),
                ],
              ),
            ),
          ),
        ],
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
