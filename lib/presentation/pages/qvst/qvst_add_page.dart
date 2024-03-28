import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:xpeapp_admin/data/entities/qvst/qvst_question_entity.dart';
import 'package:xpeapp_admin/data/entities/qvst/theme/qvst_theme_entity.dart';
import 'package:xpeapp_admin/presentation/pages/qvst/widgets/qvst_choice_theme.dart';
import 'package:xpeapp_admin/presentation/pages/qvst/widgets/qvst_response_list_form.dart';
import 'package:xpeapp_admin/presentation/pages/template/scaffold_template.dart';
import 'package:xpeapp_admin/presentation/widgets/app_loader.dart';
import 'package:xpeapp_admin/presentation/widgets/custom_text_field.dart';
import 'package:xpeapp_admin/providers.dart';
import 'package:yaki_ui/yaki_ui.dart';

class QvstAddPage extends ConsumerStatefulWidget {
  const QvstAddPage({
    super.key,
  });

  @override
  ConsumerState<QvstAddPage> createState() => _QvstAddPageState();
}

class _QvstAddPageState extends ConsumerState<QvstAddPage> {
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final loaderState = ref.watch(loaderStateProvider);
    return ScaffoldTemplate(
      appBarTitle: 'Ajouter un QVST',
      appBarLeading: IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () {
          ref.watch(qvstNotifierProvider.notifier).setTheme(null);
          Navigator.of(context).pop();
        },
      ),
      child: Stack(
        children: [
          Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'Choisissez un thème',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const QvstChoiceTheme(),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'Ajouter la question',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomTextField(
                    width: MediaQuery.of(context).size.width * 0.8,
                    hintText: 'Question',
                    controller: controller,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'Choisissez le référentiel de réponses',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const QvstResponseListForm(),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.6,
                    child: Button.secondary(
                      text: 'Ajouter la question',
                      onPressed: (ref.watch(qvstNotifierProvider) == null ||
                              ref.watch(qvstAnswerRepoSelectedProvider) ==
                                  null ||
                              controller.text.isEmpty)
                          ? null
                          : () => sendQvst(
                                onSuccess: () {
                                  Navigator.of(context).pop();
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text('QVST ajouté'),
                                    ),
                                  );
                                },
                                onError: () {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text(
                                          'Erreur lors de l\'ajout du QVST'),
                                    ),
                                  );
                                },
                              ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          if (loaderState)
            const Center(
              child: AppLoader(
                color: Colors.black,
              ),
            ),
        ],
      ),
    );
  }

  Future<void> sendQvst({
    required VoidCallback onSuccess,
    required VoidCallback onError,
  }) async {
    // Init loader
    ref.read(loaderStateProvider.notifier).showLoader();

    QvstThemeEntity? theme = ref.read(qvstNotifierProvider);
    String? idAnswerRepo = ref.watch(qvstAnswerRepoSelectedProvider)?.id;
    QvstQuestionEntity question = QvstQuestionEntity(
      question: controller.text,
      theme: theme?.name ?? '',
      idTheme: theme?.id ?? '',
      answerRepoId: idAnswerRepo,
    );
    final response = await ref.read(qvstServiceProvider).addQvst(
          question,
        );
    if (response) {
      ref.read(loaderStateProvider.notifier).hideLoader();
      controller.clear();
      ref.read(qvstNotifierProvider.notifier).setTheme(null);
      ref.read(qvstAnswerRepoSelectedProvider.notifier).clearAnswerRepo();
      // ignore: unused_result
      ref.refresh(
        qvstQuestionsByThemesListProvider(theme?.id ?? ''),
      );
      onSuccess();
    } else {
      ref.read(loaderStateProvider.notifier).hideLoader();
      onError();
    }
  }
}
