import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:xpeapp_admin/data/backend_api.dart';
import 'package:xpeapp_admin/data/backend_api_base.dart';
import 'package:xpeapp_admin/data/entities/admin_users.dart';
import 'package:xpeapp_admin/data/entities/agenda/birthday_entity.dart';
import 'package:xpeapp_admin/data/entities/agenda/events_entity.dart';
import 'package:xpeapp_admin/data/entities/agenda/events_type_entity.dart';
import 'package:xpeapp_admin/data/entities/config.dart';
import 'package:xpeapp_admin/data/entities/idea_box/idea_entity.dart';
import 'package:xpeapp_admin/data/entities/menu_entity.dart';
import 'package:xpeapp_admin/data/entities/qvst/qvst_answer_repo_entity.dart';
import 'package:xpeapp_admin/data/entities/qvst/qvst_campaign_entity.dart';
import 'package:xpeapp_admin/data/entities/qvst/qvst_menu_selected.dart';
import 'package:xpeapp_admin/data/entities/qvst/qvst_question_entity.dart';
import 'package:xpeapp_admin/data/entities/qvst/analysis/qvst_analysis_entity.dart';
import 'package:xpeapp_admin/data/entities/qvst/stats/qvst_stats_entity.dart';
import 'package:xpeapp_admin/data/entities/qvst/theme/qvst_theme_entity.dart';
import 'package:xpeapp_admin/data/entities/xpeho_user.dart';
import 'package:xpeapp_admin/data/enum/agenda_menu.dart';
import 'package:xpeapp_admin/data/enum/crud_page_mode.dart';
import 'package:xpeapp_admin/data/enum/newsletter_publication_moment.dart';
import 'package:xpeapp_admin/data/enum/qvst_menu.dart';
import 'package:xpeapp_admin/data/service/agenda_service.dart';
import 'package:xpeapp_admin/data/service/auth_service.dart';
import 'package:xpeapp_admin/data/service/file_service.dart';
import 'package:xpeapp_admin/data/service/idea_service.dart';
import 'package:xpeapp_admin/data/service/qvst_service.dart';
import 'package:xpeapp_admin/data/service/storage_service.dart';
import 'package:xpeapp_admin/data/state/agenda_menu_notifier.dart';
import 'package:xpeapp_admin/data/state/comment_for_campaign_notifier.dart';
import 'package:xpeapp_admin/data/state/loader_state.dart';
import 'package:xpeapp_admin/data/state/menu_notifier.dart';
import 'package:xpeapp_admin/data/state/newsletter_publication_notifier.dart';
import 'package:xpeapp_admin/data/state/qvst_answer_repo_notifier.dart';
import 'package:xpeapp_admin/data/state/qvst_menu_notifier.dart';
import 'package:xpeapp_admin/data/state/qvst_questions_selected_for_campaign.dart';
import 'package:xpeapp_admin/data/state/qvst_themes_notifier.dart';
import 'package:xpeapp_admin/data/state/repositories/impl/login_repository_impl.dart';
import 'package:xpeapp_admin/data/state/repositories/impl/newsletter_repository_impl.dart';
import 'package:xpeapp_admin/data/state/response_reference_selection_notifier.dart';
import 'package:xpeapp_admin/data/state/user_notifier.dart';
import 'package:xpeapp_admin/data/token_interceptor.dart';

const menuNewsletter = 1;
const menuFeatureFlipping = 2;
const menuQvst = 3;
const menuAgenda = 4;
const menuIdeaBox = 5;

// Config
final configProvider = Provider<Config>((ref) {
  return Config(baseUrl: ''); // Valeur par défaut
});

final adminProvider = Provider<AdminUsers>((ref) {
  return AdminUsers(users: []); // Valeur par défaut
});

// Backend et services
final dioProvider = Provider<Dio>((ref) {
  return Dio();
});

final backendApiBaseProvider = Provider<BackendApiBase>((ref) {
  return BackendApiBase(
    baseUrl: ref.watch(configProvider).baseUrl,
  );
});

final backendApiProvider = Provider<BackendApi>((ref) {
  return BackendApi(
    ref.watch(dioProvider),
    baseUrl: ref.watch(configProvider).baseUrl,
  );
});

final authServiceProvider = Provider<AuthService>((ref) {
  return AuthService(
    ref.watch(backendApiProvider),
  );
});

final fileServiceProvider = Provider<FileService>((ref) {
  return FileService();
});

final qvstServiceProvider = Provider<QvstService>((ref) {
  return QvstService(
    ref.watch(backendApiBaseProvider),
    ref.watch(backendApiProvider),
    ref.watch(fileServiceProvider),
    ref.watch(configProvider).baseUrl,
  );
});

// Agenda
final agendaServiceProvider = Provider<AgendaService>((ref) {
  return AgendaService(ref.watch(backendApiProvider));
});

// Firebase
final authFirebaseProvider = Provider<FirebaseAuth>((ref) {
  return FirebaseAuth.instance;
});

final cloudFirestoreProvider = Provider<FirebaseFirestore>((ref) {
  return FirebaseFirestore.instance;
});

final storageFirebaseProvider = Provider<FirebaseStorage>((ref) {
  return FirebaseStorage.instance;
});

// Loader
final loaderStateProvider = StateNotifierProvider<LoaderState, bool>((ref) {
  return LoaderState();
});

// Login
final loginProvider = Provider<LoginRepositoryImpl>((ref) {
  return LoginRepositoryImpl(
    ref.watch(authFirebaseProvider),
    ref.watch(cloudFirestoreProvider),
    ref.watch(authServiceProvider),
    ref.watch(adminProvider),
  );
});

final userProvider = StateNotifierProvider<UserNotifier, XpehoUser?>((ref) {
  return UserNotifier(ref.watch(loginProvider));
});

final userConnectedProvider = Provider<XpehoUser?>((ref) {
  // Get user from loginProvider
  var user = ref.watch(userProvider);

  // Interceptor to add token to request
  var dio = ref.watch(dioProvider);
  dio.interceptors.clear();
  dio.interceptors.add(
    TokenInterceptor(user),
  );

  // Return user
  return user;
});

// Newsletter
final newsletterProvider = Provider<NewsletterRepositoryImpl>((ref) {
  return NewsletterRepositoryImpl(
    firestore: ref.watch(cloudFirestoreProvider),
    backendApi: ref.watch(backendApiProvider),
  );
});

final newsletterPublicationProvider =
    StateNotifierProvider<NewsletterPublicationNotifier, NewsletterPublication>(
  (ref) => NewsletterPublicationNotifier(),
);

final newsletterPublicationDateProvider = Provider<Timestamp?>((ref) => null);

// QVST
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

final qvstThemesSelectionProvider =
    StateNotifierProvider<QvstThemesNotifier, List<QvstThemeEntity>>((ref) {
  return QvstThemesNotifier();
});

final qvstAnswerRepoListProvider =
    FutureProvider<List<QvstAnswerRepoEntity>>((ref) async {
  return ref.watch(qvstServiceProvider).getQvstAnswersRepo();
});

final responseReferenceSelectionProvider = StateNotifierProvider.family<
    ResponseReferenceSelectionNotifier,
    QvstAnswerRepoEntity?,
    String>((ref, id) {
  final qvstAnswerSets = ref.watch(qvstAnswerRepoListProvider);
  final selection = qvstAnswerSets.maybeWhen(
    data: (data) => data.firstWhere(
      (repo) => repo.id == id,
    ),
    orElse: () => null,
  );
  return ResponseReferenceSelectionNotifier(selection);
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

final qvstCampaignAnalysisProvider =
    FutureProvider.family<QvstAnalysisEntity, String>(
  (ref, id) async {
    return ref.watch(qvstServiceProvider).getQvstCampaignAnalysisById(id);
  },
);

// Menu
final listOfMenuProvider = Provider<List<MenuEntity>>((ref) {
  return [
    MenuEntity(
      id: menuNewsletter,
      title: 'Newsletters',
      asset: Icons.email_outlined,
    ),
    MenuEntity(
      id: menuFeatureFlipping,
      title: 'Feature Flipping',
      asset: Icons.toggle_on_outlined,
    ),
    MenuEntity(
      id: menuQvst,
      title: 'QVST',
      asset: Icons.question_answer_outlined,
    ),
    MenuEntity(
      id: menuAgenda,
      title: 'Agenda',
      asset: Icons.calendar_today_outlined,
    ),
    MenuEntity(
      id: menuIdeaBox,
      title: 'Boite à idées',
      asset: Icons.lightbulb_outline,
    ),
  ];
});

final menuSelectedProvider = StateNotifierProvider<MenuNotifier, MenuEntity?>(
  (ref) {
    return MenuNotifier();
  },
);

final commentForCampaignNotifier =
    StateNotifierProvider<CommentForCampaignNotifier, String?>((ref) {
  return CommentForCampaignNotifier();
});

// Agenda

// Editing provider
final editingEntityEventsProvider = StateProvider<EventsEntity?>((ref) => null);
// Page mode provider
final pageModeProvider =
    StateProvider<CrudPageMode>((ref) => CrudPageMode.view);

// Menu
final selectedAgendaMenuProvider =
    StateNotifierProvider<SelectedAgendaMenuNotifier, AgendaMenu?>((ref) {
  return SelectedAgendaMenuNotifier();
});

// Events
final agendaEventsProvider =
    FutureProvider.family<List<EventsEntity>, int>((ref, page) async {
  final agendaService = ref.watch(agendaServiceProvider);
  return agendaService.getAllEvents(page: page);
});
final agendaEventProvider =
    FutureProvider.family<EventsEntity, String>((ref, id) async {
  return ref.watch(agendaServiceProvider).getEventById(id);
});
final agendaEventAddProvider =
    FutureProvider.family<void, EventsEntity>((ref, event) async {
  await ref.watch(agendaServiceProvider).addEvent(event);
});
final agendaEventUpdateProvider =
    FutureProvider.family<void, EventsEntity>((ref, event) async {
  await ref.watch(agendaServiceProvider).updateEvent(event);
});
final agendaEventDeleteProvider =
    FutureProvider.family<void, String?>((ref, id) async {
  await ref.watch(agendaServiceProvider).deleteEvent(id ?? '');
});

// Events-Type
// Editing provider
final editingEntityEventsTypeProvider =
    StateProvider<EventsTypeEntity?>((ref) => null);

final agendaEventsTypeProvider =
    FutureProvider<List<EventsTypeEntity>>((ref) async {
  return ref.watch(agendaServiceProvider).getAllEventsType();
});
final agendaEventTypeProvider =
    FutureProvider.family<EventsTypeEntity, String>((ref, id) async {
  return ref.watch(agendaServiceProvider).getEventTypeById(id);
});
final agendaEventsTypeAddProvider =
    FutureProvider.family<void, EventsTypeEntity>((ref, eventType) async {
  await ref.watch(agendaServiceProvider).addEventType(eventType);
});
final agendaEventsTypeUpdateProvider =
    FutureProvider.family<void, EventsTypeEntity>((ref, eventType) async {
  await ref.watch(agendaServiceProvider).updateEventType(eventType);
});
final agendaEventsTypeDeleteProvider =
    FutureProvider.family<void, String>((ref, id) async {
  await ref.watch(agendaServiceProvider).deleteEventType(id);
});

// Birthday

// Editing provider
final editingEntityBirthdayProvider =
    StateProvider<BirthdayEntity?>((ref) => null);
final agendaBirthdayProvider =
    FutureProvider.family<List<BirthdayEntity>, int>((ref, param) async {
  final agendaService = ref.watch(agendaServiceProvider);
  return agendaService.getAllBirthdays(page: param);
});
final agendaBirthdayAddProvider =
    FutureProvider.family<void, BirthdayEntity>((ref, event) async {
  await ref.watch(agendaServiceProvider).addBirthday(event);
});
final agendaBirthdayUpdateProvider =
    FutureProvider.family<void, BirthdayEntity>((ref, event) async {
  await ref.watch(agendaServiceProvider).updateBirthday(event);
});
final agendaBirthdayDeleteProvider =
    FutureProvider.family<void, String?>((ref, id) async {
  await ref.watch(agendaServiceProvider).deleteBirthday(id ?? '');
});

// Storage
final editingStorageImageProvider = StateProvider<String?>((ref) => null);
final storageServiceProvider = Provider<StorageService>((ref) {
  return StorageService(
    ref.watch(backendApiProvider),
  );
});

// Idea Box
final ideaServiceProvider = Provider<IdeaService>((ref) {
  final api = ref.watch(backendApiProvider);
  return IdeaService(api);
});

// Editing provider
final editingEntityIdeaProvider = StateProvider<IdeaEntity?>((ref) => null);

final ideasProvider =
    FutureProvider.family<List<IdeaEntity>, ({int page, String? status})>(
        (ref, params) async {
  final ideaService = ref.watch(ideaServiceProvider);
  return ideaService.getAllIdeas(page: params.page, status: params.status);
});

final ideaProvider = FutureProvider.family<IdeaEntity, String>((ref, id) async {
  return ref.watch(ideaServiceProvider).getIdeaById(id);
});

final ideaAddProvider =
    FutureProvider.family<void, IdeaEntity>((ref, idea) async {
  await ref.watch(ideaServiceProvider).addIdea(idea);
});

final ideaUpdateStatusProvider =
    FutureProvider.family<void, Map<String, String>>((ref, params) async {
  final ideaService = ref.watch(ideaServiceProvider);
  await ideaService.updateIdeaStatus(params['id']!, params['status']!);
});
