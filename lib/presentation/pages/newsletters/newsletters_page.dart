import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:xpeapp_admin/data/entities/newsletter_entity.dart';
import 'package:xpeapp_admin/presentation/widgets/newsletter_card.dart';

class NewslettersPage extends ConsumerWidget {
  const NewslettersPage({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      margin: const EdgeInsets.all(10),
      child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
        stream:
            FirebaseFirestore.instance.collection('newsletters').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<NewsletterEntity> docs = snapshot.data!.docs
                .map(
                  (e) => NewsletterEntity.fromJson(
                    e.data(),
                  ).copyWith(
                    id: e.id,
                  ),
                )
                .toList()
              ..sort(
                (a, b) => b.date.compareTo(a.date),
              );
            if (docs.isEmpty) {
              return const Center(
                child: Text('Aucune newsletter'),
              );
            } else {
              return ListView.builder(
                itemCount: docs.length,
                itemBuilder: (context, index) {
                  NewsletterEntity newsletter = docs[index];
                  return NewsletterCard(
                    newsletter: newsletter,
                  );
                },
              );
            }
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
