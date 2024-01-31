import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:xpeapp_admin/data/backend_api.dart';
import 'package:xpeapp_admin/data/entities/config.dart';
import 'package:xpeapp_admin/data/entities/qvst/qvst_answer_repo_entity.dart';
import 'package:xpeapp_admin/data/entities/qvst/qvst_campaign_entity.dart';
import 'package:xpeapp_admin/data/entities/qvst/qvst_menu_selected.dart';
import 'package:xpeapp_admin/data/entities/qvst/qvst_question_entity.dart';
import 'package:xpeapp_admin/data/entities/qvst/stats/qvst_stats_entity.dart';
import 'package:xpeapp_admin/data/entities/qvst/theme/qvst_theme_entity.dart';
import 'package:xpeapp_admin/data/enum/newsletter_publication_moment.dart';
import 'package:xpeapp_admin/data/enum/qvst_menu.dart';
import 'package:xpeapp_admin/data/service/qvst_service.dart';
import 'package:xpeapp_admin/data/state/loader_state.dart';
import 'package:xpeapp_admin/data/state/newsletter_publication_notifier.dart';
import 'package:xpeapp_admin/data/state/qvst_answer_repo_notifier.dart';
import 'package:xpeapp_admin/data/state/qvst_menu_notifier.dart';
import 'package:xpeapp_admin/data/state/qvst_questions_selected_for_campaign.dart';
import 'package:xpeapp_admin/data/state/qvst_theme_notifier.dart';
import 'package:xpeapp_admin/data/state/repositories/impl/login_repository_impl.dart';
import 'package:xpeapp_admin/data/state/repositories/impl/newsletter_repository_impl.dart';

final configProvider = Provider<Config>((ref) {
  return Config(baseUrl: ''); // Valeur par défaut
});

// Backend
final backendApiProvider = Provider<BackendApi>((ref) {
  return BackendApi(
    Dio(),
    baseUrl: ref.watch(configProvider).baseUrl,
  );
});

final qvstServiceProvider = Provider<QvstService>((ref) {
  return QvstService(
    ref.watch(backendApiProvider),
  );
});
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
    firestore: ref.watch(cloudFirestoreProvider),
    backendApi: ref.watch(backendApiProvider),
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

final qvstQuestionsListProvider =
    FutureProvider<List<QvstQuestionEntity>>((ref) async {
  return ref.watch(qvstServiceProvider).getAllQvst();
});

final qvstQuestionProvider =
    FutureProvider.family<QvstQuestionEntity, String>((ref, id) async {
  return ref.watch(qvstServiceProvider).getQvstById(id);
});

final qvstThemesListProvider =
    FutureProvider<List<QvstThemeEntity>>((ref) async {
  return ref.watch(qvstServiceProvider).getAllQvstThemes();
});

final qvstQuestionsByThemesListProvider =
    FutureProvider.family<List<QvstQuestionEntity>, String>((ref, id) async {
  return ref.watch(qvstServiceProvider).getAllQvstQuestionsByThemeId(id);
});

final qvstNotifierProvider =
    StateNotifierProvider<QvstThemeNotifier, QvstThemeEntity?>((ref) {
  return QvstThemeNotifier();
});

final qvstAnswerRepoListProvider =
    FutureProvider<List<QvstAnswerRepoEntity>>((ref) async {
  return ref.watch(qvstServiceProvider).getQvstAnswersRepo();
});

final qvstAnswerRepoSelectedProvider =
    StateNotifierProvider<QvstAnswerRepoNotifier, QvstAnswerRepoEntity?>((ref) {
  return QvstAnswerRepoNotifier();
});

final qvstMenuSelectedProvider = StateProvider<QvstMenu?>((ref) {
  return null;
});

final qvstMenuProvider =
    StateNotifierProvider<QvstMenuNotifier, QvstMenuSelected?>((ref) {
  return QvstMenuNotifier();
});

final qvstDeleteQuestionProvider =
    FutureProvider.family<bool, String?>((ref, id) async {
  try {
    await ref.watch(qvstServiceProvider).deleteQvst(id ?? '');
    return true;
  } catch (e) {
    return false;
  }
});

final qvstCampaignsProvider =
    FutureProvider<List<QvstCampaignEntity>>((ref) async {
  return ref.watch(qvstServiceProvider).getAllQvstCampaigns();
});

final qvstQuestionsForCampaignProvider = StateNotifierProvider<
    QvstQuestionsSelectedForCampaign, List<QvstQuestionEntity>>((ref) {
  return QvstQuestionsSelectedForCampaign();
});

final qvstCampaignStatsProvider =
    FutureProvider.family<QvstStatsEntity, String>(
  (ref, id) async {
    return ref.watch(qvstServiceProvider).getQvstCampaignStatsById(id);
  },
);
