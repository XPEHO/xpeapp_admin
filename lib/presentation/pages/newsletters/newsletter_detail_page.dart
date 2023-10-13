import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:xpeapp_admin/data/entities/newsletter_entity.dart';
import 'package:xpeapp_admin/data/enum/admin_access.dart';
import 'package:xpeapp_admin/presentation/pages/template/scaffold_template.dart';
import 'package:xpeapp_admin/presentation/widgets/widget_access.dart';
import 'package:xpeapp_admin/providers.dart';
import 'package:yaki_ui/button.dart';
import 'package:url_launcher/url_launcher.dart' as url_launcher;

class NewsletterDetailPage extends ConsumerWidget {
  final String id;

  const NewsletterDetailPage({
    super.key,
    required this.id,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
        stream: FirebaseFirestore.instance
            .collection('newsletters')
            .doc(id)
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          NewsletterEntity newsletter = NewsletterEntity.fromJson(
            snapshot.data!.data()!,
          );
          return ScaffoldTemplate(
            appBarTitle: 'Contenu de la newsletter',
            appBarLeading: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(Icons.arrow_back),
            ),
            floatingActionButton: WidgetAccess(
              haveAccess: AdminAccess.editNewsletter,
              uidUser: ref.read(uidUserProvider),
              authorizedWidget: FloatingActionButton(
                onPressed: () => Navigator.pushNamed(
                  context,
                  '/newsletter/edit',
                  arguments: newsletter,
                ),
                backgroundColor: Colors.grey,
                child: const Icon(
                  Icons.edit,
                  color: Colors.white,
                ),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.date_range),
                    const SizedBox(width: 10),
                    Text(
                      'Date : ${DateFormat('dd/MM/yyyy').format(newsletter.date.toDate())}',
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                const Text(
                  "Sommaire de la newsletter",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  setupPageOfContent(newsletter.summary),
                  textAlign: TextAlign.start,
                  style: const TextStyle(
                    fontSize: 15,
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const SizedBox(height: 20),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: Button(
                          text: 'Ouvrir la newsletter',
                          onPressed: () async => await url_launcher.launchUrl(
                            Uri.parse(newsletter.pdfUrl),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        });
  }

  String setupPageOfContent(String summary) {
    return summary.replaceAll(',', '\n');
  }
}
