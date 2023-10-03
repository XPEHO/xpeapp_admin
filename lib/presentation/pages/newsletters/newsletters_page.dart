import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:xpeapp_admin/data/entities/newsletter_entity.dart';
import 'package:xpeapp_admin/presentation/pages/template/scaffold_template.dart';
import 'package:xpeapp_admin/presentation/widgets/newsletter_card.dart';

class NewslettersPage extends StatelessWidget {
  const NewslettersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaffoldTemplate(
      appBarTitle: 'Newsletters',
      appBarLeading: IconButton(
        onPressed: () => Navigator.pop(context),
        icon: const Icon(Icons.arrow_back),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, '/newsletter/add'),
        backgroundColor: Colors.grey,
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 20),
          Expanded(
            child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
              stream: FirebaseFirestore.instance
                  .collection('newsletters')
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  List<NewsletterEntity> docs = snapshot.data!.docs
                      .map(
                        (e) => NewsletterEntity.fromJson(e.data()).copyWith(
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
          ),
        ],
      ),
    );
  }
}