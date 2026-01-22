import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:xpeapp_admin/data/entities/qvst/qvst_question_entity.dart';
import 'package:xpeapp_admin/providers.dart';

class EditQuestionDialog extends StatefulWidget {
  final QvstQuestionEntity question;
  final WidgetRef? ref;
  final String? themeId;
  const EditQuestionDialog({
    required this.question,
    this.ref,
    this.themeId,
    super.key,
  });

  @override
  State<EditQuestionDialog> createState() => _EditQuestionDialogState();
}

class _EditQuestionDialogState extends State<EditQuestionDialog> {
  late bool reversed;
  late bool obsolete;
  late TextEditingController textController;
  bool saving = false;

  @override
  void initState() {
    super.initState();
    reversed = widget.question.reversedQuestionBool;
    obsolete = widget.question.noLongerUsedBool;
    textController = TextEditingController(text: widget.question.question);
  }

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Modifier la question'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            controller: textController,
            maxLines: 3,
            decoration: const InputDecoration(
              labelText: 'Intitulé',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 12),
          CheckboxListTile(
            title: const Text('Question inversée'),
            value: reversed,
            onChanged: (v) => setState(() => reversed = v ?? false),
            controlAffinity: ListTileControlAffinity.leading,
          ),
          CheckboxListTile(
            title: const Text('Question obsolète'),
            value: obsolete,
            onChanged: (v) => setState(() => obsolete = v ?? false),
            controlAffinity: ListTileControlAffinity.leading,
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: saving ? null : () => context.pop(),
          child: const Text('Annuler'),
        ),
        TextButton(
          onPressed: saving ? null : _onSave,
          child: saving
              ? const SizedBox(
                  height: 16,
                  width: 16,
                  child: CircularProgressIndicator(strokeWidth: 2),
                )
              : const Text('Enregistrer'),
        ),
      ],
    );
  }

  Future<void> _onSave() async {
    final ref = widget.ref;
    final question = widget.question;
    if (ref == null) return;
    if (question.id == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('ID de question manquant')),
      );
      return;
    }
    final newText = textController.text.trim();
    if (newText.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Le libellé ne peut pas être vide')),
      );
      return;
    }
    setState(() => saving = true);
    try {
      await ref.read(qvstServiceProvider).updateQvstQuestion(
            questionId: question.id!,
            reversedQuestion: reversed,
            noLongerUsed: obsolete,
            questionText: newText,
          );
      if (!mounted) return;
      ref.invalidate(qvstQuestionsListProvider);
      if (widget.themeId != null) {
        ref.invalidate(qvstQuestionsByThemesListProvider(widget.themeId!));
      }
      if (question.idTheme != null) {
        ref.invalidate(qvstQuestionsByThemesListProvider(question.idTheme!));
      }
      context.pop();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Question mise à jour')),
      );
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Erreur: ${e.toString()}')),
      );
    } finally {
      if (mounted) {
        setState(() => saving = false);
      }
    }
  }
}
