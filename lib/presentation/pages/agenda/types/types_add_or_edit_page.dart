// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:xpeapp_admin/data/entities/agenda/events_type_entity.dart';
import 'package:xpeapp_admin/data/enum/crud_page_mode.dart';
import 'package:xpeapp_admin/presentation/pages/agenda/agenda_utils.dart';
import 'package:xpeapp_admin/presentation/widgets/agenda/agenda_sliver_form.dart';
import 'package:xpeapp_admin/presentation/widgets/agenda/agenda_form_elevated_button.dart';
import 'package:xpeapp_admin/presentation/widgets/agenda/agenda_form_field.dart';
import 'package:xpeapp_admin/presentation/widgets/agenda/agenda_form_label.dart';
import 'package:xpeapp_admin/presentation/widgets/agenda/agenda_handle_error_in_operation.dart';
import 'package:xpeapp_admin/providers.dart';
import 'package:xpeapp_admin/data/colors.dart';

class EventTypesAddOrEditPage extends ConsumerStatefulWidget {
  final CrudPageMode pageMode;
  final EventsTypeEntity? eventType;
  final VoidCallback onDismissed;

  const EventTypesAddOrEditPage({
    super.key,
    required this.pageMode,
    this.eventType,
    required this.onDismissed,
  });

  @override
  ConsumerState<EventTypesAddOrEditPage> createState() =>
      _EventTypesAddOrEditPageState();
}

class _EventTypesAddOrEditPageState
    extends ConsumerState<EventTypesAddOrEditPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController labelController = TextEditingController();
  bool isButtonEnabled = false;
  String? selectedColor;

  @override
  void initState() {
    super.initState();
    if (widget.pageMode == CrudPageMode.edit && widget.eventType != null) {
      labelController.text = widget.eventType!.label;
      selectedColor = widget.eventType!.colorCode;
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
          '${(widget.pageMode == CrudPageMode.create) ? 'Ajouter' : 'Modifier'} un type événement',
        ),
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body: Form(
        key: _formKey,
        child: AgendaSliverForm(
          subtitleText:
              'Remplissez les informations pour ${widget.pageMode == CrudPageMode.create ? 'ajouter' : 'modifier'} un type d\'événement',
          formFields: [
            const AgendaFormLabel(
              text: 'Choisissez un label pour le type : ',
              color: Colors.black,
            ),
            const SizedBox(height: 20),
            AgendaFormField(
              controller: labelController,
              hintText: 'Type de l\'événement',
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Veuillez entrer un label';
                }
                return null;
              },
            ),
            const SizedBox(height: 20),
            const AgendaFormLabel(
              text: 'Choisissez une couleur pour le type : ',
              color: Colors.black,
            ),
            const SizedBox(height: 10),
            Wrap(
              spacing: 10,
              children: AgendaUtils.colorPalette.map((color) {
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
            AgendaFormElevatedButton(
              isEnabled: isButtonEnabled,
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  final eventType = EventsTypeEntity(
                    id: widget.eventType?.id ?? '',
                    label: labelController.text,
                    colorCode: selectedColor!,
                  );
                  // Handle operation if create or update
                  handleErrorInOperation(
                    operation: () => widget.pageMode == CrudPageMode.create
                        ? ref
                            .read(agendaEventsTypeAddProvider(eventType).future)
                        : ref.read(
                            agendaEventsTypeUpdateProvider(eventType).future),
                    ref: ref,
                    context: context,
                    onSuccess: () {
                      widget.onDismissed();
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            'Type d\'événement ${(widget.pageMode == CrudPageMode.create) ? 'ajouté' : 'modifié'} avec succès',
                          ),
                        ),
                      );
                    },
                    providersToInvalidate: [
                      agendaEventsTypeProvider,
                      agendaEventsTypeAddProvider,
                      agendaEventsTypeUpdateProvider
                    ],
                  );
                }
              },
              buttonText:
                  '${(widget.pageMode == CrudPageMode.create) ? 'Ajouter' : 'Modifier'} le type',
            ),
          ],
        ),
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
