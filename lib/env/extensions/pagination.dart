import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:xpeapp_admin/data/enum/idea_box_menu.dart';
import 'package:xpeapp_admin/presentation/pages/idea_box/idea_utils.dart';
import 'package:xpeapp_admin/providers.dart';

extension PaginationWidgetRef on WidgetRef {
  bool hasNextEventsPage(int currentPage) {
    final nextPageAsync = read(agendaEventsProvider(currentPage + 1));
    return nextPageAsync.when(
      data: (events) => events.isNotEmpty,
      loading: () => false,
      error: (_, __) => false,
    );
  }

  bool hasNextBirthdaysPage(int currentPage) {
    final nextPageAsync = read(agendaBirthdayProvider(currentPage + 1));
    return nextPageAsync.when(
      data: (birthdays) => birthdays.isNotEmpty,
      loading: () => false,
      error: (_, __) => false,
    );
  }

  bool hasNextIdeasPage(int currentPage, IdeaBoxMenu filterStatus) {
    final statusFilter = filterStatus == IdeaBoxMenu.all
        ? null
        : IdeaUtils.enumToApiStatus(filterStatus);

    final nextPageAsync =
        read(ideasProvider((page: currentPage + 1, status: statusFilter)));
    return nextPageAsync.when(
      data: (ideas) => ideas.isNotEmpty,
      loading: () => false,
      error: (_, __) => false,
    );
  }
}
