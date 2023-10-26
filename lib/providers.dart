import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:xpeapp_admin/data/enum/newsletter_publication_moment.dart';
import 'package:xpeapp_admin/data/state/loader_state.dart';
import 'package:xpeapp_admin/data/state/newsletter_publication_state.dart';
import 'package:xpeapp_admin/data/state/repositories/impl/login_repository_impl.dart';
import 'package:xpeapp_admin/data/state/repositories/impl/newsletter_repository_impl.dart';

// Loader
final loaderStateProvider = StateNotifierProvider<LoaderState, bool>((ref) {
  return LoaderState();
});

final loginProvider = Provider<LoginRepositoryImpl>((ref) {
  return LoginRepositoryImpl(
    FirebaseAuth.instance,
  );
});

final loginStateProvider = StreamProvider<User?>((ref) {
  return ref.read(loginProvider).authStateChange;
});

final userConnectedProvider = Provider<User?>((ref) {
  return ref.watch(loginStateProvider).value;
});

final uidUserProvider = Provider<String>((ref) {
  return ref.watch(userConnectedProvider)?.uid ?? '';
});

final cloudFirestoreProvider = Provider<FirebaseFirestore>((ref) {
  return FirebaseFirestore.instance;
});

final newsletterProvider = Provider<NewsletterRepositoryImpl>((ref) {
  return NewsletterRepositoryImpl(
    ref.watch(cloudFirestoreProvider),
  );
});

final storageFirebaseProvider = Provider<FirebaseStorage>((ref) {
  return FirebaseStorage.instance;
});

final newsletterPublicationProvider =
    StateNotifierProvider<NewsletterPublicationNotifier, NewsletterPublication>(
  (ref) => NewsletterPublicationNotifier(),
);

final newsletterPublicationDateProvider = Provider<Timestamp?>((ref) => null);
