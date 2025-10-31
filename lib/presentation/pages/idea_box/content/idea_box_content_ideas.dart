import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:xpeapp_admin/data/colors.dart';
import 'package:xpeapp_admin/data/entities/idea_box/idea_entity.dart';
import 'package:xpeapp_admin/data/enum/idea_box_menu.dart';
import 'package:xpeapp_admin/presentation/pages/idea_box/ideas/idea_card.dart';
import 'package:xpeapp_admin/presentation/pages/idea_box/idea_utils.dart';
import 'package:xpeapp_admin/presentation/widgets/agenda/agenda_sliver_form.dart';
import 'package:xpeapp_admin/providers.dart';

class IdeaBoxContentIdeas extends ConsumerStatefulWidget {
  final IdeaBoxMenu filterStatus;

  const IdeaBoxContentIdeas({
    super.key,
    required this.filterStatus,
  });

  @override
  ConsumerState<IdeaBoxContentIdeas> createState() =>
      IdeaBoxContentIdeasState();
}

class IdeaBoxContentIdeasState extends ConsumerState<IdeaBoxContentIdeas> {
  int currentPage = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Boîte à idées XPEHO'),
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body: _buildIdeasList(),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Tooltip(
            message: "Recharger",
            child: FloatingActionButton(
              onPressed: () {
                ref.invalidate(ideasProvider);
              },
              backgroundColor: kDefaultXpehoColor,
              child: const Icon(
                Icons.refresh,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(width: 10),
          Tooltip(
            message: "Précédent",
            child: FloatingActionButton(
              onPressed: currentPage > 1
                  ? () {
                      setState(() {
                        currentPage--;
                      });
                    }
                  : null,
              backgroundColor: kDefaultXpehoColor,
              child: const Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(width: 10),
          Tooltip(
            message: "Suivant",
            child: FloatingActionButton(
              onPressed: () {
                setState(() {
                  currentPage++;
                });
              },
              backgroundColor: kDefaultXpehoColor,
              child: const Icon(
                Icons.arrow_forward,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildIdeasList() {
    final statusFilter = widget.filterStatus == IdeaBoxMenu.all
        ? null
        : IdeaUtils.enumToApiStatus(widget.filterStatus);

    final ideasAsync =
        ref.watch(ideasProvider((page: currentPage, status: statusFilter)));

    return ideasAsync.when(
      data: (ideas) {
        return _buildIdeasContent(ideas);
      },
      loading: () => const Center(
        child: CircularProgressIndicator(),
      ),
      error: (error, stackTrace) => Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.error_outline,
              size: 64,
              color: Colors.red,
            ),
            const SizedBox(height: 16),
            Text(
              'Erreur lors du chargement des idées:\n$error',
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.red),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                ref.invalidate(ideasProvider);
              },
              child: const Text('Réessayer'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildIdeasContent(List<IdeaEntity> ideas) {
    final formFields = <Widget>[
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Text(
          "Page $currentPage - ${IdeaUtils.getFilterTitle(widget.filterStatus)}",
          textAlign: TextAlign.center,
        ),
      ),
      if (ideas.isEmpty) ...[
        const Center(
          child: Padding(
            padding: EdgeInsets.all(32.0),
            child: Text(
              'Aucune idée trouvée pour ce filtre',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
          ),
        ),
      ] else
        ...ideas.map((idea) {
          return IdeaCard(
            idea: idea,
            onStatusChanged: (newStatus) async {
              try {
                await ref.read(ideaUpdateStatusProvider({
                  'id': idea.id,
                  'status': newStatus,
                }).future);
                ref.invalidate(ideasProvider);

                if (mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                          'Statut mis à jour: ${IdeaUtils.getStatusInFrench(newStatus)}'),
                      backgroundColor: Colors.green,
                    ),
                  );
                }
              } catch (error) {
                if (mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Erreur: $error'),
                      backgroundColor: Colors.red,
                    ),
                  );
                }
              }
            },
          );
        }),
      const SizedBox(height: 50),
    ];

    return AgendaSliverForm(
      subtitleText: 'Gérez les idées soumises par l\'équipe XPEHO',
      formFields: formFields,
    );
  }
}
