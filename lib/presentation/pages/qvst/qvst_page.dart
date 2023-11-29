import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:xpeapp_admin/data/enum/admin_access.dart';
import 'package:xpeapp_admin/presentation/pages/qvst/qvst_content_page.dart';
import 'package:xpeapp_admin/presentation/pages/template/scaffold_template.dart';
import 'package:xpeapp_admin/presentation/widgets/app_loader.dart';
import 'package:xpeapp_admin/presentation/widgets/widget_access.dart';
import 'package:xpeapp_admin/providers.dart';

class QvstPage extends ConsumerWidget {
  const QvstPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final questions = ref.watch(qvstQuestionsListProvider);
    return ScaffoldTemplate(
      appBarTitle: 'QVST',
      appBarLeading: IconButton(
        onPressed: () => Navigator.pop(context),
        icon: const Icon(Icons.arrow_back),
      ),
      floatingActionButton: WidgetAccess(
        haveAccess: AdminAccess.addQvstQuestion,
        authorizedWidget: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, '/qvst/add');
          },
          child: const Icon(Icons.add),
        ),
      ),
      child: RefreshIndicator(
        onRefresh: () async {
          // ignore: unused_result
          ref.refresh(qvstQuestionsListProvider);
        },
        child: questions.when(
            data: (data) => QvstContentPage(
                  questions: data,
                ),
            error: (error, stack) => Text(
                  error.toString(),
                ),
            loading: () => const AppLoader()),
      ),
    );
  }
}
