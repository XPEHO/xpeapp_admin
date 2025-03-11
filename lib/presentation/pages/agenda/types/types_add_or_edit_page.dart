// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:xpeapp_admin/data/entities/agenda/events_type_entity.dart';
import 'package:xpeapp_admin/presentation/pages/template/subtitle.dart';
import 'package:xpeapp_admin/presentation/widgets/agenda/common_widgets.dart';
import 'package:xpeapp_admin/providers.dart';
import 'package:xpeapp_admin/data/colors.dart';

enum EventTypesTypeOfPage {
  add,
  edit,
}

class EventTypesAddOrEditPage extends ConsumerStatefulWidget {
  final EventTypesTypeOfPage typePage;
  final EventsTypeEntity? eventType;
  final VoidCallback onDismissed;

  const EventTypesAddOrEditPage({
    super.key,
    required this.typePage,
    this.eventType,
    required this.onDismissed,
  });

  @override
  ConsumerState<EventTypesAddOrEditPage> createState() =>
      _EventTypesAddOrEditPageState();
}

class _EventTypesAddOrEditPageState
    extends ConsumerState<EventTypesAddOrEditPage> {
  final TextEditingController labelController = TextEditingController();
  bool isButtonEnabled = false;
  String? selectedColor;

  final List<String> colorPalette = [
    '5DFCFF',
    'FFCF56',
    'CA69FF',
    'FF7EEA',
    'FF9564',
    'D0D0D0',
    '96FFD1',
  ];

  @override
  void initState() {
    super.initState();
    if (widget.typePage == EventTypesTypeOfPage.edit &&
        widget.eventType != null) {
      labelController.text = widget.eventType!.label;
      selectedColor = widget.eventType!.color_code;
    }
    labelController.addListener(_onLabelChanged);
  }

  void _onLabelChanged() {
    setState(() {
      isButtonEnabled =
          labelController.text.isNotEmpty && selectedColor != null;
    });
  }

  @override
  void dispose() {
    labelController.removeListener(_onLabelChanged);
    labelController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          '${(widget.typePage == EventTypesTypeOfPage.add) ? 'Ajouter' : 'Modifier'} un type événement',
        ),
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          subtitleWidget(
            'Remplissez les informations pour ${widget.typePage == EventTypesTypeOfPage.add ? 'ajouter' : 'modifier'} un type d\'événement',
          ),
          const Divider(),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  getText('Choisissez un label pour le type : ',
                      color: Colors.black),
                  const SizedBox(height: 20),
                  formTextField(
                    controller: labelController,
                    hintText: 'Type de l\'événement',
                  ),
                  const SizedBox(height: 20),
                  getText('Choisissez une couleur pour le type : ',
                      color: Colors.black),
                  const SizedBox(height: 10),
                  Wrap(
                    spacing: 10,
                    children: colorPalette.map((color) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedColor = color;
                            isButtonEnabled = labelController.text.isNotEmpty &&
                                selectedColor != null;
                          });
                        },
                        child: Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            color: Color(int.parse('0xFF$color')),
                            border: selectedColor == color
                                ? Border.all(color: Colors.black, width: 2)
                                : null,
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                  const SizedBox(height: 20),
                  getElevatedButton(
                    isEnabled: isButtonEnabled,
                    onPressed: () async {
                      final eventType = EventsTypeEntity(
                        id: widget.eventType?.id ?? '',
                        label: labelController.text,
                        color_code: selectedColor!,
                      );
                      if (widget.typePage == EventTypesTypeOfPage.add) {
                        await ref.read(
                            agendaEventsTypeAddProvider(eventType).future);
                      } else {
                        await ref.read(
                            agendaEventsTypeUpdateProvider(eventType).future);
                        ref.invalidate(agendaEventsTypeProvider);
                      }
                      ref.invalidate(agendaEventsTypeProvider);
                      widget.onDismissed();
                    },
                    buttonText:
                        '${(widget.typePage == EventTypesTypeOfPage.add) ? 'Ajouter' : 'Modifier'} le type',
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: Tooltip(
        message: 'Revenir aux types d\'événements',
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
