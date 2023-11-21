import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:xpeapp_admin/data/backend_api.dart';
import 'package:xpeapp_admin/data/entities/newsletter_entity.dart';
import 'package:xpeapp_admin/data/state/repositories/newsletter_repository.dart';
import 'package:xpeapp_admin/env/extensions/newsletter.dart';

class NewsletterRepositoryImpl extends NewsletterRepository {
  final FirebaseFirestore firestore;
  final BackendApi? backendApi;

  NewsletterRepositoryImpl({
    required this.firestore,
    this.backendApi,
  });

  @override
  Future<void> addNewsletter(NewsletterEntity newsletter) async {
    try {
      await firestore.collection('newsletters').add(
            newsletter.toFirebase(),
          );
      if (backendApi != null) {
        await backendApi!.sendNotification(
          {
            'title': 'Une nouvelle newsletter est disponible !',
            'message': newsletter.summary,
          },
        );
      }
    } on FirebaseException catch (e) {
      debugPrint('Error: $e');
      throw Exception('Erreur lors de l\'ajout de la newsletter');
    }
  }

  @override
  Future<void> updateNewsletter(NewsletterEntity newsletter) async {
    try {
      await firestore.collection('newsletters').doc(newsletter.id).update(
            newsletter.toFirebase(),
          );
    } on FirebaseException catch (e) {
      debugPrint('Error: $e');
      throw Exception('Erreur lors de la modification de la newsletter');
    }
  }
}
