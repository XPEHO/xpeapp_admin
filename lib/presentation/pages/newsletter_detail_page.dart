import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:xpeapp_admin/data/colors.dart';
import 'package:xpeapp_admin/data/entities/newsletter_entity.dart';
import 'package:yaki_ui/button.dart';
import 'package:url_launcher/url_launcher.dart' as url_launcher;

class NewsletterDetailPage extends StatelessWidget {
  final String id;

  const NewsletterDetailPage({
    super.key,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kDefaultBackgroudColor,
      appBar: AppBar(
        backgroundColor: kDefaultBackgroudColor,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back),
        ),
        title: const Text('Détail de la newsletter'),
      ),
      body: StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
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
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
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
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                setupPageOfContent(newsletter.summary),
                textAlign: TextAlign.center,
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
          );
        },
      ),
    );
  }

  String setupPageOfContent(String summary) {
    return summary.replaceAll(',', '\n');
  }
}
