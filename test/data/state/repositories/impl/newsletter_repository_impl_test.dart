import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:retrofit/retrofit.dart';
import 'package:xpeapp_admin/data/backend_api.dart';
import 'package:xpeapp_admin/data/entities/newsletter_entity.dart';
import 'package:xpeapp_admin/data/state/repositories/impl/newsletter_repository_impl.dart';
import 'package:xpeapp_admin/env/extensions/newsletter.dart';

import 'newsletter_repository_impl_test.mocks.dart';

@GenerateMocks([
  FirebaseFirestore,
  CollectionReference,
  DocumentReference,
  DocumentSnapshot,
  BackendApi,
])
void main() {
  group('NewsletterRepositoryImpl', () {
    late NewsletterRepositoryImpl newsletterRepositoryImpl;
    late MockFirebaseFirestore mockFirebaseFirestore;
    late MockCollectionReference<Map<String, dynamic>> mockCollectionReference;
    late MockDocumentReference<Map<String, dynamic>> mockDocumentReference;
    late MockBackendApi mockBackendApi;

    setUpAll(() {
      mockFirebaseFirestore = MockFirebaseFirestore();
      mockCollectionReference = MockCollectionReference();
      mockDocumentReference = MockDocumentReference();
      mockBackendApi = MockBackendApi();
      newsletterRepositoryImpl = NewsletterRepositoryImpl(
        firestore: mockFirebaseFirestore,
        backendApi: mockBackendApi,
      );
    });
    test('addNewsletter success', () async {
      final newsletterTest = NewsletterEntity(
        summary: "summary",
        date: Timestamp.now(),
        publicationDate: Timestamp.now(),
        pdfUrl: "pdfUrl",
      );

      when(mockFirebaseFirestore.collection('newsletters'))
          .thenReturn(mockCollectionReference);
      when(mockCollectionReference.add(any)).thenAnswer(
        (_) => Future.value(mockDocumentReference),
      );
      when(
        mockBackendApi.sendNotification(
          {
            'title': 'Une nouvelle newsletter est disponible !',
            'message': newsletterTest.summary,
          },
        ),
      ).thenAnswer(
        (_) => Future.value(
          HttpResponse(
            null,
            Response(
              requestOptions: RequestOptions(path: ''),
            ),
          ),
        ),
      );

      // Act
      await newsletterRepositoryImpl.addNewsletter(newsletterTest);

      // Assert
      verify(mockFirebaseFirestore.collection('newsletters')).called(1);
      verify(mockCollectionReference.add(newsletterTest.toFirebase()))
          .called(1);
    });

    test('addNewsletter error', () async {
      final newsletterTest = NewsletterEntity(
        summary: "summary",
        date: Timestamp.now(),
        publicationDate: Timestamp.now(),
        pdfUrl: "pdfUrl",
      );

      when(mockFirebaseFirestore.collection('newsletters'))
          .thenReturn(mockCollectionReference);
      when(mockCollectionReference.add(any)).thenThrow(
        FirebaseException(plugin: 'plugin'),
      );

      expect(
        () async =>
            await newsletterRepositoryImpl.addNewsletter(newsletterTest),
        throwsException,
      );
    });

    test('updateNewsletter success', () async {
      final newsletterTest = NewsletterEntity(
        summary: "summary",
        date: Timestamp.now(),
        publicationDate: Timestamp.now(),
        pdfUrl: "pdfUrl",
      );

      when(mockFirebaseFirestore.collection('newsletters'))
          .thenReturn(mockCollectionReference);
      when(mockCollectionReference.doc(any)).thenAnswer(
        (_) => mockDocumentReference,
      );
      when(mockDocumentReference.update(any)).thenAnswer(
        (_) => Future.value(),
      );

      // Act
      await newsletterRepositoryImpl.updateNewsletter(newsletterTest);

      // Assert
      verify(mockDocumentReference.update(newsletterTest.toFirebase()))
          .called(1);
    });

    test('updateNewsletter error', () async {
      final newsletterTest = NewsletterEntity(
        summary: "summary",
        date: Timestamp.now(),
        publicationDate: Timestamp.now(),
        pdfUrl: "pdfUrl",
      );

      when(mockFirebaseFirestore.collection('newsletters'))
          .thenReturn(mockCollectionReference);
      when(mockCollectionReference.doc(any)).thenAnswer(
        (_) => mockDocumentReference,
      );
      when(mockDocumentReference.update(any)).thenThrow(
        FirebaseException(plugin: 'plugin'),
      );

      expect(
        () async =>
            await newsletterRepositoryImpl.updateNewsletter(newsletterTest),
        throwsException,
      );
    });
  });
}
