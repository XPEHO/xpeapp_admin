// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:xpeapp_admin/data/entities/agenda/events_put_entity.dart';
import 'package:xpeapp_admin/data/entities/agenda/events_type_entity.dart';
import 'package:xpeapp_admin/presentation/pages/template/subtitle.dart';
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
    } else {
      setState(() {
        isDateSelected = false;
      });
    }
  }

  Future<void> showTimePickerForEvent(
      BuildContext context, bool isStartTime) async {
    final TimeOfDay? selected = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
      helpText:
          isStartTime ? 'Choisir l\'heure de début' : 'Choisir l\'heure de fin',
    );

    if (selected != null) {
      setState(() {
        if (isStartTime) {
          selectedStartTime = selected;
          startTimeController.text = selected.format(context);
        } else {
          selectedEndTime = selected;
          endTimeController.text = selected.format(context);
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final dateFormatted = DateFormat('dd/MM/yyyy');
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
                  _getText(
                    'Choisissez un titre : ',
                    color: Colors.black,
                  ),
                  const SizedBox(height: 20),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    width: 500,
                    child: TextField(
                      controller: titleController,
                      decoration: InputDecoration(
                        hintText: 'Titre de l\'événement',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  _getText(
                    'Choisissez une description : ',
                    color: Colors.black,
                  ),
                  const SizedBox(height: 20),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    width: 500,
                    child: TextField(
                      controller: descriptionController,
                      maxLines: 5,
                      decoration: InputDecoration(
                        hintText: 'Description de l\'événement',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  _getText(
                    'Choisissez un lieu : ',
                    color: Colors.black,
                  ),
                  const SizedBox(height: 20),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    width: 500,
                    child: TextField(
                      controller: locationController,
                      decoration: InputDecoration(
                        hintText: 'Lieu de l\'événement',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  _getText(
                    'Choisissez un type d\'événement : ',
                    color: Colors.black,
                  ),
                  const SizedBox(height: 10),
                  eventTypes.when(
                    data: (types) {
                      return DropdownButton<EventsTypeEntity>(
                        value: types.firstWhere(
                          (type) => type.id == selectedEventType,
                          orElse: () => types.first,
                        ),
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
                    'Choisissez une heure de début : ',
                    color: Colors.black,
                  ),
                  const SizedBox(height: 20),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    width: 500,
                    child: TextField(
                      controller: startTimeController,
                      readOnly: true,
                      onTap: () => showTimePickerForEvent(context, true),
                      decoration: InputDecoration(
                        hintText: 'Heure de début',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  _getText(
                    'Choisissez une heure de fin : ',
                    color: Colors.black,
                  ),
                  const SizedBox(height: 20),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    width: 500,
                    child: TextField(
                      controller: endTimeController,
                      readOnly: true,
                      onTap: () => showTimePickerForEvent(context, false),
                      decoration: InputDecoration(
                        hintText: 'Heure de fin',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
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
                      onPressed: (isDateSelected &&
                              titleController.text.isNotEmpty &&
                              selectedEventType != null)
                          ? () async {
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
                                await ref
                                    .read(agendaEventAddProvider(event).future);
                              } else {
                                await ref.read(
                                    agendaEventUpdateProvider(event).future);
                              }
                              ref.invalidate(agendaEventsProvider);
                              widget.onDismissed();
                            }
                          : null,
                      child: Text(
                        '${(widget.typePage == EventTypePage.add) ? 'Ajouter' : 'Modifier'} l\'événement',
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

  Widget _getText(
    String text, {
    double? size = 16,
    Color? color = Colors.white,
  }) =>
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
