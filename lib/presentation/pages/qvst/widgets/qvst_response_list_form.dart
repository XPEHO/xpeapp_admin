import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:xpeapp_admin/data/entities/qvst/qvst_answer_entity.dart';
import 'package:xpeapp_admin/presentation/widgets/custom_text_field.dart';
import 'package:xpeapp_admin/providers.dart';

class QvstResponseListForm extends ConsumerStatefulWidget {
  const QvstResponseListForm({super.key});

  @override
  ConsumerState<QvstResponseListForm> createState() =>
      _QvstResponseListFormState();
}

class _QvstResponseListFormState extends ConsumerState<QvstResponseListForm> {
  final TextEditingController responseController = TextEditingController();
  final TextEditingController valueController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final responsesList = ref.watch(qvstResponseListFormProvider);
    return Column(
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomTextField(
              width: MediaQuery.of(context).size.width * 0.4,
              hintText: 'Réponse',
              controller: responseController,
              keyboardType: TextInputType.text,
            ),
            const SizedBox(
              width: 20,
            ),
            CustomTextField(
              width: MediaQuery.of(context).size.width * 0.3,
              hintText: 'Valeur (chiffre)',
              hintSize: 12.5,
              controller: valueController,
              keyboardType: TextInputType.number,
            ),
            const SizedBox(
              width: 20,
            ),
            CircleAvatar(
              radius: 30,
              backgroundColor: Colors.black,
              child: IconButton(
                onPressed: () {
                  QvstAnswerEntity answer = QvstAnswerEntity(
                    answer: responseController.text,
                    value: valueController.text,
                  );
                  ref.watch(qvstResponseListFormProvider.notifier).addResponse(
                        answer,
                      );
                  responseController.clear();
                  valueController.clear();
                },
                icon: const Icon(
                  Icons.add,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        const Text(
          'Réponses',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Container(
          height: MediaQuery.of(context).size.height * 0.2,
          width: MediaQuery.of(context).size.width * 0.8,
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.black,
            ),
          ),
          child: (responsesList.isEmpty)
              ? const Center(
                  child: Text(
                    'Aucune réponse',
                    style: TextStyle(
                      fontSize: 20,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                )
              : ListView.builder(
                  itemCount: responsesList.length,
                  itemBuilder: (context, index) {
                    QvstAnswerEntity answer = responsesList[index];
                    return ListTile(
                      title: Text(
                        "Réponse: ${answer.answer}",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                        "Valeur: ${answer.value}",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 13,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                      trailing: IconButton(
                        onPressed: () {
                          ref
                              .watch(qvstResponseListFormProvider.notifier)
                              .removeResponse(answer);
                        },
                        icon: const Icon(
                          Icons.delete,
                          color: Colors.red,
                        ),
                      ),
                    );
                  },
                ),
        ),
      ],
    );
  }
}
