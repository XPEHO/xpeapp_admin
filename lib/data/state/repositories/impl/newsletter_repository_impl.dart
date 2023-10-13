import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:xpeapp_admin/data/entities/newsletter_entity.dart';
import 'package:xpeapp_admin/data/state/repositories/newsletter_repository.dart';

class NewsletterRepositoryImpl extends NewsletterRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Future<void> addNewsletter(NewsletterEntity newsletter) async {
    try {
      await _firestore.collection('newsletters').add(
        {
          'date': newsletter.date,
          'summary': newsletter.summary,
          'pdfUrl': newsletter.pdfUrl,
        },
      );
    } on FirebaseException catch (e) {
      debugPrint('Error: $e');
      throw Exception('Erreur lors de l\'ajout de la newsletter');
    }
  }

  @override
  Future<void> updateNewsletter(NewsletterEntity newsletter) async {
    try {
      await _firestore.collection('newsletters').doc(newsletter.id).update(
        {
          'date': newsletter.date,
          'summary': newsletter.summary,
          'pdfUrl': newsletter.pdfUrl,
        },
      );
    } on FirebaseException catch (e) {
      debugPrint('Error: $e');
      throw Exception('Erreur lors de l\'ajout de la newsletter');
    }
  }
}
